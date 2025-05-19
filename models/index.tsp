import "@typespec/http";

@example(#{ classId: 123456, deliveryMode: DeliveryMode.inPerson })
model Session {
    classId: int32;
    deliveryMode: DeliveryMode;
}

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
