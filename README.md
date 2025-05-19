
# maahita.OpenApi
This repo contains OpenAPI documentation for maahita modules.

## Build & Deployment


### Build (Compile and Prepare OpenAPI Artifacts)

To generate the OpenAPI YAML and prepare the public directory for deployment, run:

```sh
npm run compile
```

**What this does:**
- Compiles the TypeSpec files (`main.tsp` and models) using the TypeSpec compiler.
- Emits the OpenAPI 3.0 YAML file to `tsp-output/schema/openapi.yaml`.
- Creates the `public` directory if it doesn't exist.
- Copies the generated `openapi.yaml` to `public/openapi.yaml`.
- Copies the static `index.html` from `static/index.html` to `public/index.html`.

This ensures that both the OpenAPI spec and the documentation landing page are ready for deployment.

### Deploy to Firebase Hosting

To deploy the API documentation and OpenAPI YAML to Firebase Hosting, run:

```sh
npm run deploy
```

**What this does:**
- Runs the compile step above to ensure all files are up to date.
- Deploys the contents of the `public` directory (including `index.html` and `openapi.yaml`) to the configured Firebase Hosting site.

#### After deployment
- The documentation landing page (index.html) will be available at: `https://<your-project-id>.web.app/`
- The raw OpenAPI YAML will be available at: `https://<your-project-id>.web.app/openapi.yaml`


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
