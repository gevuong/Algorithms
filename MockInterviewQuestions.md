## HTTPS vs HTTP
- HTTPS (Hyper Text Transfer Protocol Secure) is a secure version of HTTP. All communications between your browser and server is encrypted.

- To setup HTTPS for website, need to buy, activate, and install SSL certificate.


## Ring Buffer
### What is it?
- A data structure. The way a ring buffer works is to think of the array as circular rather than linear, connecting end-to-end.

### Why is it useful?
- Allows unshift() method to execute in O(1) time because we keep track of

### A ring buffer's key functionality
- find(index)
- #unshift(item)
- #push(item)
- #delete(item)

### What to Keep Track Of?
- Length of stored data
- capacity (used to track when to resize array, different from length)
- location in memory
- start location, or memory location of arr[0]

[https://github.com/appacademy/sf-job-search-curriculum/blob/master/algorithms/arrays/arrays_reading.md]


### Load Balancer in Web Architecture
- Acts like middleware to distribute load to different servers, balancing the load.

## CSRF (Cross-Site Request Forgery)
- Formal definition: An attack that forces a user to execute unwanted actions on a web application in which they're currently authenticated.

- For example: User visits a form that says, "Click to win a puppy!". If user clicks, it instead issues a POST request to facebook.com to like a/A's page.
- CSRF is a form to have users like a page
- To prevent CSRF attacks on your forms, set an authenticity token in your session. (An authenticity token is just a random number with no special meaning.)
- On any non-GET request, Rails protects you from CSRF by either raising the `ActionController::InvalidAuthenticityToken` exception**, or logging out user by changing :exception to :null_session, which clears session.

## XSS (Cross-site Scripting)
- Expose vulnerabilities on client-side to manipulate client-side scripts like HTML and JS to execute in a manner desired by malicious user.

- i.e. Attacker sends victim a misleading email with a link containing malicious JS.


## Difference between XSS and CSRF
- Cross-site Request Forgery occurs during authenticated sessions. Cross-site scripting doesn't need an authenticated session.
-



## Event Loop in JS
- "Don't block the event loop" means to not put slow code on the call stack because it blocks functionality on the browser.
- The event loop is a queue of callback functions. When an async function executes, the callback function is pushed into the queue. The event loop isn't processed until the code in the call stack has been executed.

- setTimeout, DOM(document), and ajax(XMLHTTPRequest) are web APIs provided by the browser, not in JavaScript Runtime: Chrome V8 Engine.
- When the web API is done processing setTimeout for example, the webAPI pushes the callback on to the task queue when it's done. That's when the event loop comes into play.

- The event loop looks at the stack and the task queue. If the stack is empty it takes the first thing on the queue and pushes it onto the stack, which effectively runs the callback.

- The stack is like JavaScript land, back inside V8.

### Render Queue
- Render call cannot run until the call stack is cleared, so it behaves like a callback. But the render has a higher priority than the callback.

- If render is blocked due to a synchronous function running like forEach, you cannot click things on screen and see a response.

Event Loop[http://latentflip.com/loupe/?code=JC5vbignYnV0dG9uJywgJ2NsaWNrJywgZnVuY3Rpb24gb25DbGljaygpIHsKICAgIHNldFRpbWVvdXQoZnVuY3Rpb24gdGltZXIoKSB7CiAgICAgICAgY29uc29sZS5sb2coJ1lvdSBjbGlja2VkIHRoZSBidXR0b24hJyk7ICAgIAogICAgfSwgMjAwMCk7Cn0pOwoKY29uc29sZS5sb2coIkhpISIpOwoKc2V0VGltZW91dChmdW5jdGlvbiB0aW1lb3V0KCkgewogICAgY29uc29sZS5sb2coIkNsaWNrIHRoZSBidXR0b24hIik7Cn0sIDUwMDApOwoKY29uc29sZS5sb2coIldlbGNvbWUgdG8gbG91cGUuIik7!!!PGJ1dHRvbj5DbGljayBtZSE8L2J1dHRvbj4%3D]
