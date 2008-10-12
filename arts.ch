= arts: |-
  ARTS is Another RJS Test System
  
  For a complete tutorial, see http://glu.ttono.us/articles/2006/05/29/guide-test-driven-rjs-with-arts.
  
== Usage:
    assert_rjs :alert, 'Hi!'
    assert_rjs :assign, 'a', '2'
    assert_rjs :call, 'foo', 'bar', 'baz'
    assert_rjs :draggable, 'draggable_item'
    assert_rjs :drop_receiving, 'receiving_item'
    assert_rjs :hide, "post_1", "post_2", "post_3"
    assert_rjs :insert_html, :bottom, 'posts'
    assert_rjs :redirect_to, :action => 'list'
    assert_rjs :remove, "post_1", "post_2", "post_3"
    assert_rjs :replace, 'completely_replaced_div'
    assert_rjs :replace, 'completely_replaced_div', '<p>This replaced the div</p>'
    assert_rjs :replace, 'completely_replaced_div', /replaced the div/
    assert_rjs :replace_html, 'replaceable_div', "This goes inside the div"
    assert_rjs :show, "post_1", "post_2", "post_3"
    assert_rjs :sortable, 'sortable_item'
    assert_rjs :toggle, "post_1", "post_2", "post_3"
    assert_rjs :visual_effect, :highlight, "posts", :duration => '1.0'
  
  For the square bracket syntax (page['some_id'].toggle) use :page followed by the id and then subsequent method calls. Assignment requires a '=' at the end of the method name followed by the value.
  
    assert_rjs :page, 'some_id', :toggle
    assert_rjs :page, 'some_id', :style, :color=, 'red'
