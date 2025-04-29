# maahita.OpenApi
This repo contains OpenAPI documentation for maahita modules.

## Session API

### Route
`GET /api/v1/sessions/{classId}`

#### Authorization
All session routes require a Bearer token in the `Authorization` header.

#### Sample Request
```
GET /api/v1/sessions/123456
Authorization: Bearer <token>
```

#### Sample Request Body (for POST/PUT/PATCH)
```json
{
  "classId": 123456,
  "deliveryMode": "in-person" // or "online"
}
```

#### Sample Response (200 OK)
```json
{
  "classId": 123456,
  "deliveryMode": "in-person"
}
```

#### Error Responses

- **404 Not Found**
  ```json
  {
    "code": "NOT_FOUND",
    "message": "Session not found"
  }
  ```
- **401 Unauthorized**
  ```json
  {
    "code": "UNAUTHORIZED",
    "message": "Missing or invalid authentication."
  }
  ```
- **500 Internal Server Error**
  ```json
  {
    "code": "INTERNAL_SERVER_ERROR",
    "message": "An unexpected error occurred."
  }
  ```
