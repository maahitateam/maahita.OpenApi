import "@typespec/http";
import "./index.tsp";
import "./error.tsp";

using TypeSpec.Http;

@doc("Response for a successful list of sessions.")
model SessionListResponse {
    ...OkResponse;
    ...Body<Session[]>;
}

@doc("Response for a successful session fetch.")
model SessionResponse {
    ...OkResponse;
    ...Body<Session>;
}

@doc("Response for a successful session creation.")
model SessionCreateResponse {
    ...CreatedResponse;
    ...Body<Session>;
}

@doc("Response for a successful session acceptance.")
model SessionAcceptResponse {
    ...AcceptedResponse;
    ...Body<Session>;
}

@doc("Response for a successful session update.")
model SessionUpdateResponse {
    ...OkResponse;
    ...Body<Session>;
}

@doc("Response for internal server errors.")
model InternalServerErrorResponse {
    @statusCode statusCode: 500;
    @body error: InternalServerError;
}

@doc("Response for session validation errors.")
model SessionValidationErrorResponse {
    ...BadRequestResponse;
    ...Body<ValidationError>;
}

@doc("Response when a session is not found.")
model SessionNotFoundErrorResponse {
    ...NotFoundResponse;
    ...Body<NotFoundError>;
}

@doc("Response for unauthorized session access.")
model SessionUnauthorizedErrorResponse {
    ...UnauthorizedResponse;
    ...Body<UnauthorizedError>;
}

@doc("Response for forbidden session access.")
model SessionForbiddenErrorResponse {
    ...ForbiddenResponse;
    ...Body<UnauthorizedError>;
}

@doc("Response for session conflict errors.")
model SessionConflictErrorResponse {
    ...ConflictResponse;
    ...Body<ValidationError>;
}
