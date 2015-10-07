The modules framework is a small pseudo MVC framework I made to help me simplify small module development by abstracting the data, view and control functions to separate files. It is made to follow the convention-over-configuration ideology that was so popular a few years back and has since become the standard best practise for framework development.

I have two versions: PHP and ColdFusion. The basic idea behind them is identical. In fact, if you compared the files side by side, you would find that the code is almost identical, with exception to the intricacies of each language.

Why not build one for ASP.Net you might ask? Well I considered this but the truth is that ASP.Net does not really need a framework. Data manipulation is abstracted to the code-behind layer, the view is in the component/page file, and control functions are acheived by using events. In effect by making such a module I would be rejecting the very conventions of ASP.Net.

The folder structure is as follows:

**modules
  * controller.php | controller.cfm
  * module
    * module-params.php | module-params.cfm
    * action
      * (mode).php | (mode).cfm
    * view
      * (mode).php | (mode).cfm**

The controller is passed a variable, "mode" - this variable is used to look up files, starting in the action folder and then proceeding to the view folder. Mode can be set inside action files by setting the "$mode/this.mode" variable. If mode is changed, the action file will be processed (if present), and when mode is no longer changed by the action file, processing continues to the view. Views are seen as endpoints so changing the mode here will do nothing.

The module-params file is optional - it is executed at the start of each request and can be used to detect and/or initialise any parameters that are used throughout the module.

Say that you had a form, the default mode is "form", any variables used to populate the form would be present in actions/form.php, the form interface would be displayed in views/form.php.

On submit, mode is set to "submit". Any validation would be done in the actions/submit.php file and then (if successful), mode will be set to "save". The file actions/save.php would then be invoked to save the record, after which mode is set to "complete". Since there is no action file for "complete", the controller continues on to the view, views/complete.php, which would display a message to the user.