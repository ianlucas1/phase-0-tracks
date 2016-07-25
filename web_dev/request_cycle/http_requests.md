## Challenge 9.1 Release 1

**What are some common HTTP status codes?**

*HTTP Status Code - 200 OK:*  Successful request, and the return depends on the method used in the request.

*HTTP Status Code - 301 Moved Permanently:* Requested resource has a new Uniform Resource Identifier, and the new URI should be used in future requests.

*HTTP Status Code - 400 Bad Request:* The syntax of the request cannot be interpreted and future requests should be modified to fix the incorrect syntax.

*HTTP Status Code - 403 Forbidden:* Request is refused due to non-authorization of the client.

*HTTP Status Code -* 404 Not Found: Nothing on the server matches the requested path.

*HTTP Status Code - 503 Service Unavailable:* Server is unable to process a client's request (this is usually temporary and could be caused by many things, like a server overload, crash, or maintenance)

**What is the difference between a GET request and a POST request? When might each be used?**

HTTP (hypertext transfer protocol) permits request and response interactions between servers and users (clients).  A web app on a server can have interactions with the browser's of individual users, for instance.  The interaction can begin as a GET request for some content, sent by the user.  Alternatively, a server or client can send a POST request that includes data to be processed by the receiver.

**What is a cookie (the technical kind, not the delicious kind)? How does it relate to HTTP requests?**

Cookies are a confidential shared connection ("web key") between client a server that is sent with each request from the client so that the server can keep track and verify that the requests are coming from the same client.  This has negative security implications if the cookie can be intercepted by a nefarious agent.  There are apparently compatibility issues with REST, the "underlying architectural principle" of the Internet.  Because it has to be processed, it can also cause performance issues, especially with mobile device clients.
