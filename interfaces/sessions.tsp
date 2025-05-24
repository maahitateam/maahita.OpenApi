import "../models/index.tsp";
import "../models/response.tsp";
using TypeSpec.Http;
namespace MaahitaAPIServices {
    @route("/api/v1/sessions")
    @tag("Sessions")
    interface Sessions {
        /** List sessions */
        @get
        @doc("List all sessions")
        @useAuth(BearerAuth)
        list(
        ): ListResponse<Session> | UnauthorizedErrorResponse | RateLimitErrorResponse;

        /** Create a session */
        @post
        @doc("Create a new session")
        @useAuth(BearerAuth)
        create(@body body: Session):
            | AcceptResponse<Session>
            | ValidationErrorResponse<Session>
            | ConflictErrorResponse<Session>
            | UnauthorizedErrorResponse
            | InternalServerErrorResponse;

        /** End session */
        @put
        @doc("End an existing session")
        @useAuth(BearerAuth)
        update(@path sessionId: int32, @body body: Session):
            | SuccessResponse<Session>
            | ValidationErrorResponse<Session>
            | NotFoundErrorResponse<Session>
            | UnauthorizedErrorResponse
            | InternalServerErrorResponse;

        /** Delete a session */
        @delete
        @useAuth(BearerAuth)
        delete(@path classId: int32):
            | SuccessResponse<Session>
            | NotFoundErrorResponse<Session>
            | UnauthorizedErrorResponse
            | InternalServerErrorResponse;

        // get session by id
        @get
        @useAuth(BearerAuth)
        @doc("Get a session by sessionId")
        getSession(
            @path sessionId: int32,
        ): SuccessResponse<Session> | UnauthorizedErrorResponse | InternalServerErrorResponse;

        // update participant status
        @put
        @useAuth(BearerAuth)
        @doc("Update participant status in a session")
        @route("/{sessionId}/participants/{participantId}")
        updateParticipantStatus(
            @path sessionId: int32,
            @path participantId: int32,
            @body body: {
                status: boolean;
            },
        ):
            | SuccessResponse<SessionParticipant>
            | ValidationErrorResponse<SessionParticipant>
            | NotFoundErrorResponse<SessionParticipant>
            | UnauthorizedErrorResponse
            | InternalServerErrorResponse;

        @post
        @useAuth(BearerAuth)
        @doc("Add a participant to a session")
        @route("/{sessionId}/participants/{participantId}")
        addParticipant(
            @path sessionId: int32,
            @path participantId: int32,
            @body body: {
                status: boolean;
            },
        ):
            | SuccessResponse<SessionParticipant>
            | ValidationErrorResponse<SessionParticipant>
            | NotFoundErrorResponse<SessionParticipant>
            | UnauthorizedErrorResponse
            | InternalServerErrorResponse;
    }
}
