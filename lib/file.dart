// {
// "info": {
// "_postman_id": "17a360f5-904d-4b58-8d67-f4148172fff6",
// "name": "API Documentation #reference",
// "description": "This template contains a boilerplate for documentation that you can quickly customize and reuse.\n\n### How to use this template:\n\n- Replace the content given brackets (()) with your API's details.\n- Tips are formatted in `codespan` - feel free to read and remove them.\n    \n\n---\n\n`Start with a brief overview of what your API offers.`\n\nThe ((product name)) provides many API products, tools, and resources that enable you to ((add product value here)).\n\n`You can also list the APIs you offer, link to the relevant pages, or do both in this section.`\n\n## **Getting started guide**\n\n`List the steps or points required to start using your APIs. Make sure to cover everything required to reach success with your API as quickly as possible.`\n\nTo start using the ((add APIs here)), you need to -\n\n`The points given below are from The Postman API's documentation. You can reference it to write your own getting started guide.`\n\n- You must use a valid API Key to send requests to the API endpoints. You can get your API key from Postman's [integrations dashboard](https://go.postman.co/settings/me/api-keys).\n- The API has [rate and usage limits](https://postman.postman.co/workspace/Collection-Templates~6311738d-2e70-441f-ae12-78caf078c5b7/collection/22517504-e9c28f47-1253-44af-a2f3-20dce4da1f18?ctx=documentation#rate-and-usage-limits).\n- The API only responds to HTTPS-secured communications. Any requests sent via HTTP return an HTTP 301 redirect to the corresponding HTTPS resources.\n- The API returns request responses in JSON format. When an API request returns an error, it is sent in the JSON response as an error key.\n    \n\n## Authentication\n\n`Add details on the authorization keys/tokens required, steps that cover how to get them, and the relevant error codes.`\n\nThe ((product name)) API uses ((add your API's authorization type)) for authentication.\n\n`The details given below are from the Postman API's documentation. You can reference it to write your own authentication section.`\n\nPostman uses API keys for authentication. You can generate a Postman API key in the [API keys](https://postman.postman.co/settings/me/api-keys) section of your Postman account settings.\n\nYou must include an API key in each request to the Postman API with the X-Api-Key request header.\n\n### Authentication error response\n\nIf an API key is missing, malformed, or invalid, you will receive an HTTP 401 Unauthorized response code.\n\n## Rate and usage limits\n\n`Use this section to cover your APIs' terms of use. Include API limits, constraints, and relevant error codes, so consumers understand the permitted API usage and practices.`\n\n`The example given below is from The Postman API's documentation. Use it as a reference to write your APIs' terms of use.`\n\nAPI access rate limits apply at a per-API key basis in unit time. The limit is 300 requests per minute. Also, depending on your plan, you may have usage limits. If you exceed either limit, your request will return an HTTP 429 Too Many Requests status code.\n\nEach API response returns the following set of headers to help you identify your use status:\n\n| Header | Description |\n| --- | --- |\n| `X-RateLimit-Limit` | The maximum number of requests that the consumer is permitted to make per minute. |\n| `X-RateLimit-Remaining` | The number of requests remaining in the current rate limit window. |\n| `X-RateLimit-Reset` | The time at which the current rate limit window resets in UTC epoch seconds. |\n\n### 503 response\n\nAn HTTP `503` response from our servers indicates there is an unexpected spike in API access traffic. The server is usually operational within the next five minutes. If the outage persists or you receive any other form of an HTTP `5XX` error, [contact support](https://support.postman.com/hc/en-us/requests/new/).\n\n### **Need some help?**\n\n`Add links that customers can refer to whenever they need help.`\n\nIn case you have questions, go through our tutorials ((link to your video or help documentation here)). Or visit our FAQ page ((link to the relevant page)).\n\nOr you can check out our community forum, there’s a good chance our community has an answer for you. Visit our developer forum ((link to developer forum)) to review topics, ask questions, and learn from others.\n\n`You can also document or add links to libraries, code examples, and other resources needed to make a request.`",
// "schema": "https://schema.getpostman.com/json/collection/v2.1.0/collection.json",
// "_exporter_id": "14860883"
// },
// "item": [
// {
// "name": "Collections",
// "item": [
// {
// "name": "Register",
// "request": {
// "method": "POST",
// "header": [],
// "body": {
// "mode": "formdata",
// "formdata": [
// {
// "key": "name",
// "value": "User ",
// "type": "text"
// },
// {
// "key": "email",
// "value": "user@innovins.com",
// "type": "text"
// },
// {
// "key": "mobile",
// "value": "9999999999",
// "type": "text"
// },
// {
// "key": "password",
// "value": "123456",
// "type": "text"
// }
// ]
// },
// "url": {
// "raw": "https://shareittofriends.com/demo/flutter/Register.php",
// "protocol": "https",
// "host": [
// "shareittofriends",
// "com"
// ],
// "path": [
// "demo",
// "flutter",
// "Register.php"
// ]
// }
// },
// "response": []
// },
// {
// "name": "Login",
// "request": {
// "method": "POST",
// "header": [],
// "body": {
// "mode": "formdata",
// "formdata": [
// {
// "key": "email",
// "value": "user@innovins.com",
// "type": "text"
// },
// {
// "key": "password",
// "value": "123456",
// "type": "text"
// }
// ]
// },
// "url": {
// "raw": "https://shareittofriends.com/demo/flutter/Login.php",
// "protocol": "https",
// "host": [
// "shareittofriends",
// "com"
// ],
// "path": [
// "demo",
// "flutter",
// "Login.php"
// ]
// }
// },
// "response": []
// },
// {
// "name": "Product List",
// "request": {
// "method": "POST",
// "header": [],
// "body": {
// "mode": "formdata",
// "formdata": [
// {
// "key": "user_login_token",
// "value": "c2a2f674c6f6a1d2374da1ebfab69adc",
// "type": "text"
// }
// ]
// },
// "url": {
// "raw": "https://shareittofriends.com/demo/flutter/productList.php",
// "protocol": "https",
// "host": [
// "shareittofriends",
// "com"
// ],
// "path": [
// "demo",
// "flutter",
// "productList.php"
// ]
// }
// },
// "response": []
// },
// {
// "name": "add Product",
// "request": {
// "method": "POST",
// "header": [],
// "body": {
// "mode": "formdata",
// "formdata": [
// {
// "key": "user_login_token",
// "value": "c2a2f674c6f6a1d2374da1ebfab69adc",
// "type": "text"
// },
// {
// "key": "name",
// "value": "Prod 1",
// "type": "text"
// },
// {
// "key": "moq",
// "value": "20",
// "type": "text"
// },
// {
// "key": "price",
// "value": "20",
// "type": "text"
// },
// {
// "key": "discounted_price",
// "value": "18",
// "type": "text"
// }
// ]
// },
// "url": {
// "raw": "https://shareittofriends.com/demo/flutter/addProduct.php",
// "protocol": "https",
// "host": [
// "shareittofriends",
// "com"
// ],
// "path": [
// "demo",
// "flutter",
// "addProduct.php"
// ]
// }
// },
// "response": []
// },
// {
// "name": "edit Product",
// "request": {
// "method": "POST",
// "header": [],
// "body": {
// "mode": "formdata",
// "formdata": [
// {
// "key": "user_login_token",
// "value": "c2a2f674c6f6a1d2374da1ebfab69adc",
// "type": "text"
// },
// {
// "key": "name",
// "value": "Prod fjdshgxkjd",
// "type": "text"
// },
// {
// "key": "moq",
// "value": "20",
// "type": "text"
// },
// {
// "key": "price",
// "value": "20",
// "type": "text"
// },
// {
// "key": "discounted_price",
// "value": "18",
// "type": "text"
// },
// {
// "key": "id",
// "value": "1",
// "type": "text"
// }
// ]
// },
// "url": {
// "raw": "https://shareittofriends.com/demo/flutter/editProduct.php",
// "protocol": "https",
// "host": [
// "shareittofriends",
// "com"
// ],
// "path": [
// "demo",
// "flutter",
// "editProduct.php"
// ]
// }
// },
// "response": []
// },
// {
// "name": "Delete Product",
// "request": {
// "method": "POST",
// "header": [],
// "body": {
// "mode": "formdata",
// "formdata": [
// {
// "key": "user_login_token",
// "value": "c2a2f674c6f6a1d2374da1ebfab69adc",
// "type": "text"
// },
// {
// "key": "id",
// "value": "2",
// "type": "text"
// }
// ]
// },
// "url": {
// "raw": "https://shareittofriends.com/demo/flutter/deleteProduct.php",
// "protocol": "https",
// "host": [
// "shareittofriends",
// "com"
// ],
// "path": [
// "demo",
// "flutter",
// "deleteProduct.php"
// ]
// }
// },
// "response": []
// }
// ],
// "description": "The `/collections` endpoints let you manage your [collections](https://learning.postman.com/docs/sending-requests/intro-to-collections/)."
// }
// ],
// "auth": {
// "type": "apikey",
// "apikey": [
// {
// "key": "key",
// "value": "X-API-Key",
// "type": "string"
// },
// {
// "key": "value",
// "value": "{{token}}",
// "type": "string"
// }
// ]
// },
// "event": [
// {
// "listen": "prerequest",
// "script": {
// "type": "text/javascript",
// "exec": [
// ""
// ]
// }
// },
// {
// "listen": "test",
// "script": {
// "type": "text/javascript",
// "exec": [
// ""
// ]
// }
// }
// ],
// "variable": [
// {
// "key": "baseUrl",
// "value": "https://farming-simulator.pstmn.io"
// }
// ]
// }
