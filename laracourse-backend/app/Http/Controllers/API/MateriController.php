<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Course;
use App\Models\Materi;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;

class MateriController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        // define model materi
        $materis = Materi::with('course');

        // filter
        if(@$request['search']) {
            $materis->where(function($query) use ($request) {
                $query->where('subject', 'like', '%'.$request['search'].'%');
            });
        }

        if(@$request['course']) {
            $materis->whereRelation('course', 'slug', $request['course']);
        }

        $materis = $materis->latest()->paginate($request['ordering'] ?? 10);

        // return response
        return response()->json($materis);
    }

    public function kursus(){
        $course = Course::all();
        return response()->json($course);
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
        'subject' => 'required',
        'content' => 'required',
        'link' => 'required',
        // 'course_id' => 'required|numeric|exists:courses,id'
    ]);

    // if validation is fail
    if($validation->fails()) {

        // return error response
        return response()->json([
            'errors' => $validation->errors(),
        ], 422);
    }

    // store to materi
    $materi = Materi::create([
        'slug' => Str::slug($request->subject),
        'subject' => $request->subject,
        'content' => $request->content,
        'link' => $request->link,
        'course_id' => $request->course_id,
    ]);

    // return response
    return response()->json([
        'message' => 'Successfully created materi',
        'data' => $materi->load('course'),
    ]);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
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
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        // define query materi by id
    $materi = Materi::find($id);

    // return if materi not found
    if(!$materi) {
        return response()->json([
            'message' => 'materi not found'
        ], 404);
    }

    // delete materi
    $materi->delete();

    return response()->json([
        'message' => 'Successfully deleted materi'
    ]);
    }
}

