<?php

namespace Database\Seeders;

use App\Models\Category;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class CategorySeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // Disable foreign key check
        DB::statement('SET FOREIGN_KEY_CHECKS = 0');

        // Hapus isi table setiap kali menjalankan seeder
        DB::table('categories')->truncate();

        $data = [
            'Web Development', 'Graphic Design', 'Digital Marketing', 'UI/UX Designer', 'Digital Skills'
        ];

        foreach ($data as $d) {
            Category::create([
                'name' => $d,
                'slug' => str()->slug($d),
            ]);
        }

        DB::statement('SET FOREIGN_KEY_CHECKS=1');
    }
}
