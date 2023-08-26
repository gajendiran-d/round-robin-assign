<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Teacher;

class TeacherController extends Controller
{
    public function create()
    {
        return view('teachers.create');
    }

    public function store(Request $request)
    {
        try {
            $validated = $request->validate([
                'name' => 'required|string',
                'email' => 'required|email|unique:teachers',
                'age' => 'required',
                'image' => 'required|image|mimes:jpeg,png,jpg,gif|max:2048',
            ]);
            // Create a new teacher instance
            $teacher = new Teacher();
            $teacher->name  = $request->input('name');
            $teacher->email = $request->input('email');
            $teacher->age = $request->input('age');
            // Document Upload
            if ($request->hasFile('image')) {
                $image = $request->file('image');
                $imageName = 'img' . date("YmdHisu") . '.' . $image->getClientOriginalExtension();
                $destinationPath = public_path() . '/image';
                if (!is_dir($destinationPath)) {
                    mkdir($destinationPath, 0777, true);
                }
                $image->move($destinationPath, $imageName);
                $teacher->image = $imageName;
            }
            $teacher->save();
            return redirect()->route('teachers.create')->with('success', 'Teacher created successfully.');
        } catch (\Exception $e) {
            return redirect()->route('teachers.create')->with('error', $e->getMessage());
        }
    }
}
