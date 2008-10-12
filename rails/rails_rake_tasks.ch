= rails_rake_tasks: |-
  rake cache:clear                     # Clears all cached pages
  
  rake db:bootstrap                    # Loads a schema.rb file into the database 
                                         and then loads the initial database 
                                         fixtures.
  
  rake db:bootstrap:copy_default_theme # Copy default theme to site theme
  
  rake db:migrate                      # Migrate the database through scripts in 
                                         db/migrate. Target specific version with 
                                         VERSION=x
  
  rake db:schema:dump                  # Create a db/schema.rb file that can be 
                                         portably used against any DB supported by                         
                                         AR
  
  rake db:schema:load                  # Load a schema.rb file into the database
  
  rake db:bootstrap:load               # Load initial database fixtures (in 
                                         db/bootstrap/*.yml) into the current 
                                         environment's database.  Load specific  
                                         fixtures using FIXTURES=x,y
  
  rake db:fixtures:load                # Load fixtures into the current    
                                         environment's database.  Load specific 
                                         fixtures using FIXTURES=x,y
  
  rake db:sessions:clear               # Clear the sessions table
  
  rake db:sessions:create              # Creates a sessions table for use with 
                                         CGI::Session::ActiveRecordStore
  
  rake db:structure:dump               # Dump the database structure to a SQL file
  
  rake db:test:clone                   # Recreate the test database from the 
                                         current environment's database schema
  
  rake db:test:clone_structure         # Recreate the test databases from the 
                                         development structure
  
  rake db:test:prepare                 # Prepare the test database and load the 
                                         schema
  
  rake db:test:purge                   # Empty the test database
  
  rake deploy                          # Push the latest revision into production  
                                         using the release manager
  
  rake diff_from_last_deploy           # Describe the differences between HEAD and 
                                         the last production release
  
  rake doc:app                         # Build the app HTML Files
  
  rake doc:clobber_app                 # Remove rdoc products
  
  rake doc:clobber_plugins             # Remove plugin documentation
  
  rake doc:clobber_rails               # Remove rdoc products
  
  rake doc:plugins                     # Generate documation for all installed  
                                         plugins
  
  rake doc:rails                       # Build the rails HTML Files
  
  rake doc:reapp                       # Force a rebuild of the RDOC files
  
  rake doc:rerails                     # Force a rebuild of the RDOC files
  
  rake edge                            # freeze rails edge
  
  rake log:clear                       # Truncates all *.log files in log/ to zero 
                                         bytes
  
  rake rails:freeze:edge               # Lock to latest Edge Rails or a specific 
                                         revision with REVISION=X (ex: 
                                         REVISION=4021) or a tag with TAG=Y (ex: 
                                         TAG=rel_1-1-0)
  
  rake rails:freeze:gems               # Lock this application to the current gems 
                                         (by unpacking them into vendor/rails)
  
  rake rails:unfreeze                  # Unlock this application from freeze of 
                                         gems or edge and return to a fluid use of 
                                         system gems
  
  rake rails:update                    # Update both configs, scripts and  
                                         public/javascripts from Rails
  
  rake rails:update:configs            # Update config/boot.rb from your current 
                                         rails install
  
  rake rails:update:javascripts        # Update your javascripts from your current 
                                         rails install
  
  rake rails:update:scripts            # Add new scripts to the application 
                                         script/ directory
  
  rake remote_exec                     # Execute a specific action using the  
                                         release manager
  
  rake rollback                        # Rollback to the release before the 
                                         current release in production
  
  rake show_deploy_tasks               # Enumerate all available deployment tasks
  
  rake stats                           # Report code statistics (KLOCs, etc) from 
                                         the application
  
  rake test                            # Test all units and functionals
  
  rake test:functionals                # Run tests for functionalsdb:test:prepare
  
  rake test:integration                # Run tests for integrationdb:test:prepare
  
  rake test:plugins                    # Run tests for pluginsenvironment
  
  rake test:recent                     # Run tests for recentdb:test:prepare
  
  rake test:uncommitted                # Run tests for uncommitteddb:test:prepare
  
  rake test:units                      # Run tests for unitsdb:test:prepare
  
  rake tmp:cache:clear                 # Clears all files and directories in 
                                         tmp/cache
  
  rake tmp:clear                       # Clear session, cache, and socket files 
                                         from tmp/
  
  rake tmp:create                      # Creates tmp directories for sessions,
                                         cache, and sockets
  
  rake tmp:pids:clear                  # Clears all files in tmp/pids
  
  rake tmp:sessions:clear              # Clears all files in tmp/sessions
  
  rake tmp:sockets:clear               # Clears all files in tmp/sockets
  
  rake update_dialog_helper            # Copies the latest dialog.js to the 
                                         application's public directory
