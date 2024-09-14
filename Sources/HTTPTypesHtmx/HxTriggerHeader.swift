import HTTPTypes

extension HTTPField.Name {
  /// HX-Trigger Request/Response Header
  ///
  /// ## When used as a Request Header
  /// the id of the triggered element if it exists
  ///
  /// [https://htmx.org/reference/#request_headers](https://htmx.org/reference/#request_headers)
  ///
  /// ## When used in as a Response Header
  /// allows you to trigger client-side events
  ///
  /// [https://htmx.org/headers/hx-trigger/](https://htmx.org/headers/hx-trigger/)
  public static var hxTrigger: Self { .init("HX-Trigger")! }
}

extension HTTPField {
  /// Creates an "HX-Trigger: \(id)" request header
  ///
  /// the id of the triggered element if it exists
  ///
  /// [https://htmx.org/reference/#request_headers](https://htmx.org/reference/#request_headers)
  public static func hxTrigger(id triggeredElementId: String) -> Self {
    .init(name: .hxTrigger, value: triggeredElementId)
  }

  /// Creates an "HX-Trigger: \(event)" response header
  ///
  /// These response headers can be used to trigger client side actions on the target element within a response to htmx. You can trigger a single event or as many uniquely named events as you would like.
  ///
  /// The headers are:
  ///
  /// * HX-Trigger - trigger events as soon as the response is received.
  /// * HX-Trigger-After-Settle - trigger events after the [settling step](https://htmx.org/docs/#request-operations).
  /// * HX-Trigger-After-Swap - trigger events after the [swap step](https://htmx.org/docs/#request-operations).
  ///
  /// To trigger a single event with no additional details you can simply send the event name in a header like so:
  ///
  /// ```
  /// HX-Trigger: myEvent
  /// ```
  ///
  /// This will trigger myEvent on the triggering element and will bubble up to the body. As an example you could listen for this event like this:
  ///
  /// ```js
  /// document.body.addEventListener("myEvent", function(evt){
  ///     alert("myEvent was triggered!");
  /// })
  /// ```
  /// … or like this, if you’re trying to trigger some element without using JS code:
  ///
  /// ```html
  /// <!-- Since it bubbles up to the <body>, we must use the `from:body` modifier below -->
  /// <div hx-trigger="myEvent from:body" hx-get="/example"></div>
  /// ```
  /// If you want to pass details along with the event, you can move to JSON for the value of the trigger:
  ///
  /// ```
  /// HX-Trigger: {"showMessage":"Here Is A Message"}
  /// ```
  ///
  /// To handle this event you would write the following code:
  ///
  /// ```js
  /// document.body.addEventListener("showMessage", function(evt){
  ///     alert(evt.detail.value);
  /// })
  /// ```
  ///
  /// Note that the value of the message was put into the detail.value slot. If you wish to pass multiple pieces of data you can use a nested JSON object on the right hand side of the JSON object:
  ///
  /// ```
  /// HX-Trigger: {"showMessage":{"level" : "info", "message" : "Here Is A Message"}}
  /// ```
  ///
  /// And handle this event like so:
  ///
  /// ```js
  /// document.body.addEventListener("showMessage", function(evt){
  ///     if(evt.detail.level === "info"){
  ///         alert(evt.detail.message);
  ///     }
  /// })
  /// ```
  /// Each property of the JSON object on the right hand side will be copied onto the details object for the event.
  ///
  /// Targetting Other Elements
  ///
  /// You can trigger events on other target elements by adding a target argument to the JSON object.
  ///
  /// ```
  /// HX-Trigger: {"showMessage":{"target" : "#otherElement"}}
  /// ```
  ///
  /// Multiple Triggers
  ///
  /// If you wish to invoke multiple events, you can simply add additional properties to the top level JSON object:
  ///
  /// ```
  /// HX-Trigger: {"event1":"A message", "event2":"Another message"}
  /// ```
  ///
  /// You may also trigger multiple events with no additional details by sending event names separated by commas, like so:
  ///
  /// ```
  /// HX-Trigger: event1, event2
  /// ```
  /// Using events gives you a lot of flexibility to add functionality to normal htmx responses.
  ///
  /// [https://htmx.org/headers/hx-trigger/](https://htmx.org/headers/hx-trigger/)
  public static func hxTrigger(event: String) -> Self {
    .init(name: .hxTrigger, value: event)
  }
}

extension HTTPFields {
  /// Returns the value of an HX-Trigger request/response header
  ///
  /// ## When used as a Request Header
  /// the id of the triggered element if it exists
  ///
  /// [https://htmx.org/reference/#request_headers](https://htmx.org/reference/#request_headers)
  ///
  /// ## When used in as a Response Header
  /// allows you to trigger client-side events
  ///
  /// [https://htmx.org/headers/hx-trigger/](https://htmx.org/headers/hx-trigger/)
  public var hxTrigger: String? {
    return self[.hxTrigger]
  }
}
