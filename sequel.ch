= sequel: |-
  Open a database
  
    require 'rubygems'
    require 'sequel'
  
    DB = Sequel.sqlite 'my_blog.db'
    DB = Sequel('postgres://user:password@localhost/my_db')
    DB = Sequel.mysql 'my_db', :user => 'user', :password => 'password', :host => 'localhost'
    DB = Sequel.ado 'mydb'
  
  Open an SQLite memory database
  
  Without a filename argument, the sqlite adapter will setup a new sqlite database in RAM.
  
    DB = Sequel.sqlite
  
  Logging SQL statements
  
    require 'logger'
    DB = Sequel.sqlite '', :loggers => [Logger.new($stdout)]
    # or
    DB.loggers << Logger.new(...)
  
  Using raw SQL
  
    DB << "CREATE TABLE users (name VARCHAR(255) NOT NULL, age INT(3) NOT NULL)"
    DB.fetch("SELECT name FROM users") do |row|
      p r[:name]
    end
    dataset = DB["SELECT age FROM users"]
    dataset.print
    dataset.map(:age)
  
  Create a dataset
  
    dataset = DB[:items]
    dataset = DB.dataset.from(:items)
  
  Most dataset methods are chainable
  
    dataset = DB[:managers].where(:salary => 5000..10000).order(:name, :department)
    # or
    dataset = DB.query do
      from :managers
      where :salary => 5000..10000
      order :name, :department
    end
  
  Insert rows
  
    dataset.insert(:name => 'Sharon', :grade => 50)
    dataset << {:name => 'Sharon', :grade => 50} # same effect as above
  
  Retrieve rows
  
    dataset.each {|r| p r}
    dataset.all #=> [{...}, {...}, ...]
    dataset.first
    dataset.order(:name).last # works only for ordered datasets
  
  Retrieve single value
    id= DB[:item].filter(:name => 'item1').select(:id).single_value
  
  Update/Delete rows
  
    dataset.filter(:active => false).delete
    dataset.filter('price < ?', 100).update(:active => true)
    DB[:user].filter(:id => 1).update(:count => :count + 1) #=> 
      "UPDATE user SET count = (count + 1) WHERE (id = 1)"
  
  Datasets are Enumerable
  
    dataset.map {|r| r[:name]}
    dataset.map(:name) # same effect as above
  
    dataset.inject {|sum, r| sum + r[:value]}
  
  Filtering (see also doc/dataset_filtering.rdoc)
  
    dataset.filter(:name => 'abc')
    dataset.filter('name = ?', 'abc')
    dataset.filter(:value > 100)
    dataset.exclude(:value <= 100)
  
    dataset.filter(:value => 50..100)
    dataset.where((:value >= 50) & (:value <= 100))
  
    dataset.where('value IN ?', [50,75,100])
  
    # Get the first record that matches a condition
== dataset[:name => 'abc'] # Same as:
    dataset.filter(:name => 'abc').first
  
    # Filter using a subquery
    dataset.filter('price > ?', dataset.select('AVG(price) + 100'))
  
  Advanced filtering using ruby expressions without blocks
  
== Available as of Sequel 2.0:
  
    DB[:items].filter(:price < 100).sql
    #=> "SELECT * FROM items WHERE (price < 100)"
  
    DB[:items].filter(:name.like('AL%')).sql
    #=> "SELECT * FROM items WHERE (name LIKE 'AL%')"
  
== There's support for nested expressions with AND, OR and NOT:
  
    DB[:items].filter((:x > 5) & (:y > 10)).sql
    #=> "SELECT * FROM items WHERE ((x > 5) AND (y > 10))"
  
    DB[:items].filter({:x => 1, :y => 2}.sql_or & ~{:z => 3}).sql
    #=> "SELECT * FROM items WHERE (((x = 1) OR (y = 2)) AND (z != 3))"
  
== You can use arithmetic operators and specify SQL functions:
  
    DB[:items].filter((:x + :y) > :z).sql
    #=> "SELECT * FROM items WHERE ((x + y) > z)"
  
    DB[:items].filter(:price < :AVG[:price] + 100).sql
    #=> "SELECT * FROM items WHERE (price < (AVG(price) + 100))"
  
  Ordering
  
    dataset.order(:kind)
    dataset.reverse_order(:kind)
    dataset.order(:kind.desc, :name)
  
  Row ranges
  
    dataset.limit(30) # LIMIT 30
    dataset.limit(30, 10) # LIMIT 30 OFFSET 10
  
  Pagination
  
    paginated = dataset.paginate(1, 10) # first page, 10 rows per page
    paginated.page_count #=> number of pages in dataset
    paginated.current_page #=> 1
    paginated.next_page #=> next page number or nil
    paginated.prev_page #=> previous page number or nil
    paginated.first_page? #=> true if page number = 1
    paginated.last_page? #=> true if page number = page_count
  
  Joins
  
    DB[:items].left_outer_join(:categories, :id => :category_id).sql #=>
      "SELECT * FROM items LEFT OUTER JOIN categories ON categories.id = items.category_id"
  
    DB[:items].join(:users, :id => :user_id).join(:resources, :id => :items__resource_id).sql #=>
      "SELECT * FROM items INNER JOIN users ON (users.id = items.user_id) INNER JOIN resources ON (resources.id = items.resource_id)"
  
    DB.from(:items___t, :users___u, :resources___r).filter(:u__id=>:t__user_id, :r__id=>:t__resource_id).sql #=>
      "SELECT * FROM items AS t, users AS u, resources AS r WHERE ((u.id = t.user_id) AND (r.id = t.resource_id))"
  
  Summarizing
  
    dataset.count #=> record count
    dataset.max(:price)
    dataset.min(:price)
    dataset.avg(:price)
    dataset.sum(:stock)
  
    dataset.group(:category).select(:category, :AVG[:price])
  
  SQL Functions / Literals
  
    dataset.update(:updated_at => :NOW[])
    dataset.update(:updated_at => 'NOW()'.lit)
  
    dataset.update(:updated_at => "DateValue('1/1/2001')".lit)
    dataset.update(:updated_at => :DateValue['1/1/2001'])
  
    dataset.filter({:updated_at.extract(:year) => 3} & {:updated_at.extract(:month) => 1}) 
  
  Schema Manipulation
  
    DB.create_table :items do
      primary_key :id
      text :name, :unique => true, :null => false
      boolean :active, :default => true
      foreign_key :category_id, :categories
      index :grade
      constraint(:check_grade) { {:grade => 0} | {:active => false} }
    end
  
    DB.drop_table :items
  
    DB.create_table :test do
      varchar :zipcode, :size => 10
      enum :system, :elements => ['mac', 'linux', 'windows']
    end
  
  Migrations
    class AddUser < Sequel::Migration
      def up
        create_table :users do
          primary_key :id
          text :username, :unique => true, :null => false
          text :email, :unique => true, :null => false
          varchar :password, :size => 40, :null => false
          date :dob, :null => false
          boolean :disabled, :default => false
          timestamp :created_at
          timestamp :updated_at
        end
      end
  
      def down
        drop_table :users
      end
    end
  
    class ModifyProfiles < Sequel::Migration
      def up
        alter_table :profiles do
          add_column :firstname, :text
          add_column :lastname, :text
  	add_index :zip
          add_constraint(:check_count) { :count > 0 }
          rename_column :col1, :col2
          set_column_default :age, 21
        end
      end
  
      def down
        alter_table :profiles do
          drop_column :firstname
          drop_column :lastname
          drop_index :zip
          rename_column :col2, :col1
        end
      end
    end
  
  
  
  Aliasing
  
    DB[:items].select(:name.as(:item_name))
    DB[:items].select(:name => :item_name)
    DB[:items].select(:name___item_name)
    DB[:items___items_table].select(:items_table__name___item_name)
    # => "SELECT items_table.name AS item_name FROM items AS items_table"
  
  Transactions
  
    DB.transaction do
      dataset << {:first_name => 'Inigo', :last_name => 'Montoya'}
      dataset << {:first_name => 'Farm', :last_name => 'Boy'}
    end # Either both are inserted or neither are inserted
  
== Database#transaction is re-entrant:
  
    DB.transaction do # BEGIN issued only here
      DB.transaction
        dataset << {:first_name => 'Inigo', :last_name => 'Montoya'}
      end
    end # COMMIT issued only here
  
== Transactions are aborted if an error is raised:
  
    DB.transaction do
      raise "some error occurred"
    end # ROLLBACK issued and the error is re-raised
  
== Transactions can also be aborted by raising Sequel::Error::Rollback:
  
    DB.transaction do
      raise(Sequel::Error::Rollback) if something_bad_happened
    end # ROLLBACK issued and no error raised
  
== Miscellaneous:
  
    dataset.sql #=> "SELECT * FROM items"
    dataset.delete_sql #=> "DELETE FROM items"
    dataset.where(:name => 'sequel').exists #=> "EXISTS ( SELECT 1 FROM items WHERE name = 'sequel' )"
    b= DB.fetch("SELECT #{DB[:item].filter(:name => 'sequel').exists}").single_value #there maybe a better way
    dataset.print #=> pretty table print to $stdout
    dataset.columns #=> array of columns in the result set, does a SELECT
    DB.schema_for_table(:items) => [[:id, {:type=>:integer, ...}], [:name, {:type=>:string, ...}], ...]
                                   # Works on PostgreSQL, MySQL, SQLite, and possibly elsewhere
  
    # indexing, and programatically creating updates
    v= 123
    periods= [:year, :month, :day]
    idx= 10
    DB[:items].update_sql(periods.inject({}){|h, p| h[p|idx] = (p|idx) + v; h}) #=> 
      "UPDATE items SET month[10] = (month[10] + 123), year[10] = (year[10] + 123), week[10] = (week[10] + 123)"
