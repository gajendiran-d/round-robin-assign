@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                @if (session('success'))
                    <div class="alert alert-success">{{ session('success') }}</div>
                @endif
                @if (session('error'))
                    <div class="alert alert-danger">{{ session('error') }}</div>
                @endif
                <div class="card">
                    <div class="card-header">{{ __('Assign Teachers to Students') }}</div>
                    <div class="card-body">
                        <form id="assign-form">
                            @csrf
                            <div class="row mb-3">
                                <label for="teachers" class="col-md-4 col-form-label">Teachers</label>
                                <div class="col-md-8">
                                    <select name="teachers[]" multiple class="form-control">
                                        @foreach ($teachers as $teacher)
                                            <option value="{{ $teacher->id }}">{{ $teacher->name }}</option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label for="students" class="col-md-4 col-form-label">Students</label>
                                <div class="col-md-8">
                                    <select name="students[]" multiple class="form-control">
                                        @foreach ($unassignedStudents as $student)
                                            <option value="{{ $student->id }}">{{ $student->name }}</option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>
                            <div class="row mb-0">
                                <div class="col-md-8 offset-md-4">
                                    <button id="assign-button" class="btn btn-primary">Assign</button>
                                </div>
                            </div>
                        </form>
                        <div id="result"></div>
                        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
                        <script>
                            $(document).ready(function() {
                                $('#assign-button').click(function(e) {
                                    e.preventDefault();
                                    const formData = new FormData($('#assign-form')[0]);
                                    $.ajax({
                                        type: 'POST',
                                        url: '/api/assign-teachers-students',
                                        data: formData,
                                        processData: false,
                                        contentType: false,
                                        success: function(data) {
                                            alert(data.message);
                                            window.location.href = data.redirect;
                                        },
                                        error: function(xhr, status, error) {
                                            console.error(xhr.responseText);
                                            $('#result').text('Assignment failed.');
                                        }
                                    });
                                });
                            });
                        </script>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
