<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Teacher;
use App\Models\Student;
use App\Models\Mapping;
use Carbon\Carbon;

class MappingController extends Controller
{
    public function assign()
    {
        $teachers = Teacher::all();
        $unassignedStudents = Student::whereDoesntHave('mappings')->get();
        return view('mappings.assign', compact('teachers', 'unassignedStudents'));
    }

    public function assignTeachersToStudents(Request $request)
    {
        $studentIds = $request->input('students');
        $teacherIds = $request->input('teachers');
        $students = Student::whereIn('id', $studentIds)->get();
        $teachers = Teacher::whereIn('id', $teacherIds)->get();
        $studentCount = count($students);
        $teacherCount = count($teachers);
        if ($studentCount === 0 || $teacherCount === 0) {
            return response()->json(['message' => 'No students or teachers selected.']);
        }
        // Mapping
        $assignments = [];
        $teacherIndex = 0;
        foreach ($students as $student) {
            $teacher = $teachers[$teacherIndex];
            $assignments[] = [
                'student_id' => $student->id,
                'teacher_id' => $teacher->id,
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ];
            // Move to the next teacher in a round-robin fashion
            $teacherIndex = ($teacherIndex + 1) % $teacherCount;
        }
        Mapping::insert($assignments);
        //success
        return response()->json([
            'message' => 'Teachers assigned to students successfully.',
            'redirect' => route('assigned-users')
        ]);
    }

    public function assignedUsers()
    {
        $assignedUsers = Mapping::with('teacher', 'student')->get();
        return view('mappings.assigned-users', compact('assignedUsers'));
    }

    public function removeMapping($id)
    {
        Mapping::findOrFail($id)->delete();
        return redirect()->back()->with('success', 'Mapping removed successfully.');
    }
}
