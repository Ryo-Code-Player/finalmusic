<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('t_motion_items', function (Blueprint $table) {
            $table->id();
            $table->integer('item_id');
            $table->string('item_code');
            $table->json('motions')->nullable();
            $table->json('user_motions')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('t_motion_items');
    }
};
