= prototype: |-
  Element Functions	 
  
  $()
  obj = $('elementID');	
    Get the html element with the ID of elementID
  objArray = $("element1","element2");
    Get an array containing multiple elements
  document.getElementsByClassName("theclass");
    Get an array containing all elements with the class theclass
  Element.removeClassName(elementID,theclass); 
    Remove the class from the element.
  Element.addClassName(elementID,theclass);	
    Add the class theclass to the element  
  new Insertion.Before(elementid,text here);	
    Inserts the text directly before the elementid element.
      text here<span id=elementid>Original</span>
  new Insertion.Top(elementid,text here);	
== Inserts the text inside the element at the top:
      <span id=elementid>text here Original</span>
  new Insertion.Bottom(elementid, text here);	
== Inserts the text inside the element at the bottom:
     <span id=elementid>Original text here</span>
  new Insertion.After(elementid,text here);	
    Inserts the text directly after the elementid element.
      <span id=elementid>Original</span>text here
  $(element1,element2).each( function (theobj){
    alert(theobj.innerHTML);
  });	
    Traverse through the array using the .each syntax similar to ruby.
  Element.hide(elementid);	
    Hides the element
  Element.show(elementid);	
    Shows the element
  Element.toggle(elementid);	
    Toggles the show/hide status of an element
  Element.remove(elementid);	
    Remove an element from the page
  
   	 
  Form Functions	 
  
  $F(fieldname);
    Return the value of the form element, whether it is a text input, textarea, select box or checkbox. If it is a checkbox, it will return undefined if unchecked. Radio groups dont work.
  Form.getElements(formID);
    Returns an array of all the form elements for form formID
  Form.serialize(formID);
    Returns a formatted URL containing all the elements in the form, similar to &field=value&field2=othervalue
  Form.focusFirstElement(formID);	
    Will set focus on the first form element.
  
   	 
  Exception Handling	 
  
  Try.these(
         function(){  
              // errors 
         }, 
         function(){
              // other stuff
         }
  );
    Allows you to execute the second function if the first one fails. 
    Kinda like try/catch, except it doesn't make any sense.
  
                         	 
  Ajax
  
  function ajaxMe( theUrl, data ){
     var ajaxRequest = new Ajax.Request(
       theUrl,{method: post, parameters: data, onComplete: theResponse});
  }
  
  function theResponse(origRequest){
      alert(origRequest.responseText);
  }
  
  Classes
  
  var Butter = Class.create({
    initialize: function(brand) {
      this.brand = brand;
      this.melted = false;
    },
    melt: function() {
      this.melted = true;
    }
  })
  var parkay = new Butter('Parkay');
  
    Prototype gives you a way to create classes. If you want, you
    can define an initialize function that will be called when
    instances of the class are created.
