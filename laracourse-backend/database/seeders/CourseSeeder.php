<?php

namespace Database\Seeders;

use Illuminate\Support\Str;
use Illuminate\Database\Seeder;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;

class CourseSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        for ($i = 1; $i <= 20; $i++) {
            $course = new \App\Models\Course();
            $course->code = 'CRS-' . $i;
            $course->slug = Str::slug($course->code);
            $course->name = fake()->sentence();
            $course->description = fake()->paragraph();
            $course->duration = rand(1, 10);
            $course->category_id = rand(1, 5);
            $course->save();
    }
}
}
