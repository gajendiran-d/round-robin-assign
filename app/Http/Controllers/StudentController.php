<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Student;

class StudentController extends Controller
{
    public function create()
    {
        return view('students.create');
    }

    public function store(Request $request)
    {
        try {
            $validated = $request->validate([
                'name' => 'required|string',
                'email' => 'required|email|unique:students',
                'age' => 'required',
                'image' => 'required|image|mimes:jpeg,png,jpg,gif|max:2048',
            ]);
            // Create a new student instance
            $student = new Student();
            $student->name  = $request->input('name');
            $student->email = $request->input('email');
            $student->age = $request->input('age');
            // Document Upload
            if ($request->hasFile('image')) {
                $image = $request->file('image');
                $imageName = 'img' . date("YmdHisu") . '.' . $image->getClientOriginalExtension();
                $destinationPath = public_path() . '/image';
                if (!is_dir($destinationPath)) {
                    mkdir($destinationPath, 0777, true);
                }
                $image->move($destinationPath, $imageName);
                $student->image = $imageName;
            }
            $student->save();
            // success
            return redirect()->route('students.create')->with('success', 'Student created successfully.');
        } catch (\Exception $e) {
            return redirect()->route('teachers.create')->with('error', $e->getMessage());
        }
    }
}
