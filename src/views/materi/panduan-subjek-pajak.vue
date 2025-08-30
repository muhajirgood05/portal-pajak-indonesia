<template>
  <div class="min-h-screen bg-gray-50 text-gray-800 py-12">
    <div class="container mx-auto max-w-4xl px-4">
      <nav class="text-sm mb-4 text-gray-600">
        <router-link to="/" class="text-blue-600 hover:underline">Beranda</router-link>
        <span class="mx-2">/</span>
        <router-link to="/materi" class="text-blue-600 hover:underline">Materi</router-link>
        <span class="mx-2">/</span>
        <span class="text-gray-700">Panduan Subjek Pajak</span>
      </nav>

      <article class="bg-white rounded-xl shadow p-6">
        <header class="mb-4">
          <h1 class="text-2xl font-bold text-blue-900">Panduan Subjek Pajak</h1>
          <p class="mt-2 text-gray-600">Ringkasan SPDN, SPLN, dan BUT.</p>
        </header>

        <section class="space-y-4 text-gray-700">
          <h2 class="text-lg font-semibold text-blue-800">Subjek Pajak Dalam Negeri (SPDN)</h2>
          <p>SPDN adalah orang pribadi, badan, atau warisan yang memenuhi kriteria tertentu di Indonesia. Contoh: orang yang bertempat tinggal di Indonesia, berada >183 hari, atau memiliki niat menetap.</p>

          <h2 class="text-lg font-semibold text-blue-800">Subjek Pajak Luar Negeri (SPLN)</h2>
          <p>SPLN adalah mereka yang tidak memenuhi kriteria SPDN. Penghasilan dari sumber Indonesia tetap dikenai PPh sesuai ketentuan.</p>

          <h2 class="text-lg font-semibold text-blue-800">Bentuk Usaha Tetap (BUT)</h2>
          <p>Bentuk usaha tetap adalah tempat usaha atau kedudukan manajemen yang menyebabkan kegiatan usaha dianggap dijalankan di Indonesia.</p>

          <div class="mt-6 p-4 bg-yellow-50 border border-yellow-200 rounded text-yellow-800">
            <strong>Catatan:</strong> Ini ringkasan. Untuk keputusan pajak tertentu, rujuk peraturan yang berlaku.
          </div>
        </section>
      </article>
    </div>
  </div>
</template>

<script setup>
// static content for now
</script>

<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap');
* { font-family: 'Inter', sans-serif; }
</style>
