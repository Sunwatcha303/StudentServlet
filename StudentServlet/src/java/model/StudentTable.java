package model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class StudentTable {

    Connection connection;

    public StudentTable() {
        String derbyClientDriver = "org.apache.derby.jdbc.ClientDriver";
        try {
            Class.forName(derbyClientDriver);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        String url = "jdbc:derby://localhost:1527/Student";
        String user = "app";
        String passwd = "app";
        try {
            connection = DriverManager.getConnection(url, user, passwd);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Student> getAllStudent() {
        String sql = "SELECT * FROM Student";
        List<Student> result = new ArrayList<>();
        try (PreparedStatement stmt = connection.prepareStatement(sql); ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Student student = new Student();
                student.setId(rs.getInt("ID"));
                student.setName(rs.getString("Name"));
                student.setGpa(rs.getDouble("GPA"));
                result.add(student);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    public Student getStudentById(int id) {
        String sql = "SELECT * FROM Student WHERE ID = ?";
        Student student = null;
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    student = new Student();
                    student.setId(rs.getInt("ID"));
                    student.setName(rs.getString("Name"));
                    student.setGpa(rs.getDouble("GPA"));
                }
            }
        } catch (SQLException e) {
            e.fillInStackTrace();
        }
        return student;
    }

    public Student addNewStudent(Student student) {
        String sql = "INSERT INTO Student(ID, Name, GPA) VALUES (?, ?, ?)";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, student.getId());
            stmt.setString(2, student.getName());
            stmt.setDouble(3, student.getGpa());

            stmt.executeUpdate();
        } catch (SQLException e) {
            e.fillInStackTrace();
        }
        return student;
    }
}
