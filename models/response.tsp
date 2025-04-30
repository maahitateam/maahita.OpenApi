import "@typespec/http";
import "./index.tsp";
import "./error.tsp";

using TypeSpec.Http;

@doc("Response for a successful list of sessions.")
model SessionListResponse {
    @statusCode statusCode: 200;
    @body sessions: Session[];
}

@doc("Response for a successful session fetch.")
model SessionResponse {
    @statusCode statusCode: 200;
    @body session: Session;
}

@doc("Response for a successful session creation.")
model SessionCreateResponse {
    @statusCode statusCode: 201;
    @body session: Session;
}

@doc("Response for a successful session acceptance.")
model SessionAcceptResponse {
    @statusCode statusCode: 202;
    @body session: Session;
}

@doc("Response for a successful session update.")
model SessionUpdateResponse {
    @statusCode statusCode: 200;
    @body session: Session;
}

@doc("Response for internal server errors.")
model InternalServerErrorResponse {
    @statusCode statusCode: 500;
    @body error: InternalServerError;
}

@doc("Response for session validation errors.")
model SessionValidationErrorResponse {
    @statusCode statusCode: 400;
    @body error: ValidationError;
}

@doc("Response when a session is not found.")
model SessionNotFoundErrorResponse {
    @statusCode statusCode: 404;
    @body error: NotFoundError;
}

@doc("Response for unauthorized session access.")
model SessionUnauthorizedErrorResponse {
    @statusCode statusCode: 401;
    @body error: UnauthorizedError;
}

@doc("Response for forbidden session access.")
model SessionForbiddenErrorResponse {
    @statusCode statusCode: 403;
    @body error: UnauthorizedError;
}

@doc("Response for session conflict errors.")
model SessionConflictErrorResponse {
    @statusCode statusCode: 409;
    @body error: ValidationError;
}
