// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StudentData {
    struct Student {
        uint256 id;
        string name;
        uint8 age;
    }

    Student public student;

    constructor(uint256 _id, string memory _name, uint8 _age) {
        require(_id > 0, "Student ID must be greater than zero");
        require(_age > 0, "Age must be greater than zero");
        student = Student(_id, _name, _age);
    }

    function updateStudent(uint256 _id, string memory _name, uint8 _age) public {
        require(_id > 0, "Student ID must be greater than zero");
        assert(_age > student.age); // Ensure newAge is greater than current age
        student.age = _age;
        student.name = _name;
        student.id = _id;
    }

    function passStudent() public {
        if (student.age <= 5) {
            revert("Student age is too low for next class");
        }
        student = Student(0, "", 0);
    }
}
