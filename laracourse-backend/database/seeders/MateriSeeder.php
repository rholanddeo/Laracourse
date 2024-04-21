<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class MateriSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        for ($i = 1; $i <= 20; $i++) {
            $materi = new \App\Models\Materi();
            $materi->subject = 'MTR-' . $i;
            $materi->slug = str()->slug($materi->subject);
            $materi->content = fake()->paragraph();
            $materi->link = fake()->url();
            $materi->course_id = rand(1, 20);
            $materi->save();
        }
    }
}
