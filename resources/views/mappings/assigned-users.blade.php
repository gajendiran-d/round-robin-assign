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
                    <div class="card-header">{{ __('Assigned Students') }}</div>
                    <div class="card-body">
                        @if ($assignedUsers->isEmpty())
                            <p>No students assigned yet.</p>
                        @else
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th scope="col">Teacher</th>
                                        <th scope="col">Student</th>
                                        <th scope="col">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($assignedUsers as $mapping)
                                        <tr>
                                            <td>{{ $mapping->teacher->name }}</td>
                                            <td>{{ $mapping->student->name }}</td>
                                            <td><a href="{{ route('remove-mapping', $mapping->id) }}"
                                                    class="btn btn-danger">Remove</a></td>
                                        </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        @endif
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
