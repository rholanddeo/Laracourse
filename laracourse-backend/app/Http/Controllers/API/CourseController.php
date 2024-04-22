<?php

namespace App\Http\Controllers\API;

use App\Models\Course;
use App\Models\Materi;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;

class CourseController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        // define model course
        $courses = Course::with(['category', 'materis']);

        // filter
        if(@$request['search']) {
            $courses->where(function($query) use ($request) {
                $query->where('code', 'like', '%'.$request['search'].'%')
                    ->orWhere('name', 'like', '%'.$request['search'].'%');
            });
        }

        if(@$request['category']) {
            $courses->whereRelation('category', 'slug', $request['category']);
        }

        $courses = $courses->latest()->paginate($request['ordering'] ?? 10);


        // return response
        return response()->json($courses);
    }

    public function material($id){
        $material = Materi::where('course_id', $id)->get();
        return response()->json($material);
    }

    public function materis(Course $course)
    {
        $materis = $course->materis;

        return response()->json($materis);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
{
    // validation
    $validation = Validator::make($request->all(), [
        'code' => 'required|unique:courses',
        'name' => 'required',
        'description' => 'required',
        'duration' => 'required|numeric',
        'category_id' => 'required|numeric|exists:categories,id'
    ]);

    // if validation is fail
    if($validation->fails()) {

        // return error response
        return response()->json([
            'errors' => $validation->errors(),
        ], 422);
    }

    // store to course
    $course = Course::create([
        'code' => $request->code,
        'slug' => Str::slug($request->code),
        'name' => $request->name,
        'description' => $request->description,
        'duration' => $request->duration,
        'category_id' => $request->category_id,
    ]);

    // return response
    return response()->json([
        'message' => 'Successfully created course',
        'data' => $course->load('category'),
    ]);
}

    /**
     * Display the specified resource.
     */
    public function show($id)
{
    // define query course by id
    $course = Course::with('category')->whereId($id)->first();

    // return if course not found
    if(!$course) {
        return response()->json([
            'message' => 'course not found'
        ], 404);
    }

    return response()->json($course);
}

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, $id)
{
    // define query course by id
    $course = Course::find($id);

    // return if course not found
    if(!$course) {
        return response()->json([
            'message' => 'course not found'
        ], 404);
    }

    // validation
    $validation = Validator::make($request->all(), [
        // 'code' => 'required|unique:courses,code,' . $id,
        'code' => 'required|unique:courses',
        'name' => 'required',
        'description' => 'required',
        'duration' => 'required|numeric',
        'category_id' => 'required|numeric|exists:categories,id'
    ]);

    // if validation is fail
    if($validation->fails()) {

        // return error response
        return response()->json([
            'errors' => $validation->errors(),
        ], 422);
    }

    // update course
    $course->update([
        'code' => $request->code,
        'slug' => Str::slug($request->code),
        'name' => $request->name,
        'description' => $request->description,
        'duration' => $request->duration,
        'category_id' => $request->category_id,
    ]);

    return response()->json([
        'message' => 'Successfully updated course'
    ]);
}

    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id)
{
    // define query course by id
    $course = Course::find($id);

    // return if course not found
    if(!$course) {
        return response()->json([
            'message' => 'course not found'
        ], 404);
    }

    // delete course
    $course->delete();

    return response()->json([
        'message' => 'Successfully deleted course'
    ]);
}
}
