import "@typespec/http";

@example(#{
    id: "session-123",
    classId: 123456,
    startedAt: "2025-05-24T13:30",
    endedAt: "2025-05-24T14:30",
    duration: 60,
    deliveryMode: DeliveryMode.online,
})
model Session {
    id: string;
    classId: int32;
    startedAt: DateTime;
    endedAt?: DateTime;
    duration?: int32;
    deliveryMode: DeliveryMode;
}

@format("date-time")
scalar DateTime extends string;

enum DeliveryMode {
    inPerson: "in-person",
    online: "online",
    hybrid: "hybrid",
}

@example(#{
    id: "123456",
    name: "Math 101",
    subject: "Mathematics",
    schoolId: "school-123",
    location: #{
        street: "123 Main St",
        city: "Srikakulam",
        state: "Andhra Pradesh",
        zipCode: "12345",
    },
    studentsCount: 30,
    curriculumProgress: 75,
})
model Class {
    id: string;
    name: string;
    subject: string;
    schoolId: string;
    location: Address;
    studentsCount: int32;
    curriculumProgress: int32;
}

@example(#{
    street: "123 Main St",
    city: "Anytown",
    state: "CA",
    zipCode: "12345",
})
model Address {
    street: string;
    city: string;
    state: string;
    zipCode: string;
}
@example(#{
    id: "school-123",
    name: "ABC High School",
    address: #{
        street: "456 Elm St",
        city: "Anytown",
        state: "CA",
        zipCode: "67890",
    },
    contactNumber: "123-456-7890",
    email: "info@abchighschool.edu",
})
model School {
    id: string;
    name: string;
    address: Address;
    contactNumber: string;
    email: string;
}
@example(#{
    id: "participant-123",
    name: "John Doe",
    isTeacher: true,
    color: "#FF5733",
    initials: "JD",
})
model Participant {
    id: string;
    name: string;
    isTeacher: boolean;
    color: string;
    initials: string;
}
@example(#{
    sessionId: "session-123",
    participantId: "participant-123",
    updatedParticipant: #{
        id: "participant-123",
        name: "John Doe",
        isTeacher: true,
        color: "#FF5733",
        initials: "JD",
    },
})
model SessionParticipant {
    sessionId: string;
    participantId: string;
    updatedParticipant: Participant;
}
