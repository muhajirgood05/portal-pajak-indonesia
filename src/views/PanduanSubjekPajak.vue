<template>
  <div class="min-h-screen bg-gray-50 text-gray-800">
    <div class="container mx-auto p-4 sm:p-6 md:p-8 max-w-4xl">
      <header class="text-center mb-8">
        <h1 class="text-3xl sm:text-4xl font-bold text-blue-900">Panduan Lengkap Subjek Pajak</h1>
        <p class="mt-2 text-lg text-gray-600">Ringkasan SPDN, SPLN, dan BUT — tema biru & kuning.</p>
      </header>

      <div class="mb-6 border-b border-gray-200">
        <nav class="flex -mb-px space-x-6 justify-center" aria-label="Tabs">
          <button
            v-for="tab in tabs"
            :key="tab.id"
            @click="activeTab = tab.id"
            :class="[
              'whitespace-nowrap py-3 px-4 border-b-2 font-medium text-sm',
              activeTab === tab.id
                ? 'border-yellow-400 text-yellow-700'
                : 'border-transparent text-gray-500 hover:text-gray-700 hover:border-gray-300'
            ]"
          >
            {{ tab.name }}
          </button>
        </nav>
      </div>

      <main>
        <section v-if="activeTab === 'spdn'" class="space-y-4">
          <p class="mb-6 text-gray-600">SPDN adalah orang pribadi, badan, atau warisan yang memenuhi kriteria tertentu di Indonesia. Berikut adalah rinciannya.</p>
          <div class="space-y-4">
            <Accordion v-for="item in spdnContent" :key="item.title" :title="item.title" :icon="item.icon">
              <p class="mb-4" v-html="item.description"></p>
              <ul class="list-disc list-inside space-y-3 pl-2">
                <li v-for="point in item.points" :key="point.main">
                  <strong v-html="point.main"></strong>
                  <ul v-if="point.subpoints" class="list-circle list-inside mt-2 pl-4 text-sm space-y-1">
                    <li v-for="sub in point.subpoints">{{ sub }}</li>
                  </ul>
                </li>
              </ul>
            </Accordion>
          </div>
        </section>

        <section v-if="activeTab === 'spln'" class="space-y-4">
          <p class="mb-6 text-gray-600">SPLN adalah kebalikan dari SPDN. Mereka adalah orang pribadi atau badan yang tidak memenuhi kriteria sebagai SPDN.</p>
          <div class="bg-white p-6 rounded-lg shadow-sm border border-gray-200">
            <h3 class="font-semibold text-lg text-gray-800 mb-3">Ketentuan Khusus WNI menjadi SPLN</h3>
            <p class="mb-3">Warga Negara Indonesia (WNI) dapat dianggap sebagai SPLN jika:</p>
            <ul class="list-disc list-inside space-y-2 pl-2">
              <li>Bekerja di luar negeri <strong>lebih dari 183 hari</strong> dalam 12 bulan.</li>
              <li>Dapat membuktikan status sebagai penduduk di luar negeri dengan dokumen resmi seperti:
                <ul class="list-circle list-inside mt-2 pl-4 text-sm space-y-1">
                  <li>Green Card</li>
                  <li>Identity Card / Student Card</li>
                  <li>Pengesahan alamat di paspor oleh perwakilan RI</li>
                  <li>Surat keterangan dari Kedubes RI</li>
                </ul>
              </li>
            </ul>
            <div class="mt-4 p-3 bg-yellow-50 border border-yellow-300 rounded-md text-sm text-yellow-800">
              <strong>Penting:</strong> Penghasilan SPLN yang bersumber dari Indonesia tetap dikenai Pajak Penghasilan (PPh) sesuai ketentuan yang berlaku.
            </div>
          </div>
        </section>

        <section v-if="activeTab === 'but'" class="space-y-4">
          <p class="mb-6 text-gray-600">Bentuk Usaha Tetap (BUT) adalah bentuk usaha yang digunakan oleh SPLN (orang pribadi atau badan) untuk menjalankan usaha atau melakukan kegiatan di Indonesia.</p>
          <div class="bg-white p-6 rounded-lg shadow-sm border border-gray-200">
            <h3 class="font-semibold text-lg text-gray-800 mb-3">Kapan SPLN Dianggap Punya BUT?</h3>
            <p>SPLN dianggap memiliki BUT jika mempunyai <strong>tempat kedudukan manajemen</strong> di Indonesia yang menjalankan operasi perusahaan sehari-hari.</p>
            <div class="mt-4 p-3 bg-yellow-50 border border-yellow-300 rounded-md text-sm text-yellow-800">
              <strong>Perhatian:</strong> Jika tempat manajemen tersebut membuat keputusan strategis dan mengendalikan seluruh perusahaan, maka statusnya bukan lagi BUT, melainkan akan diperlakukan sebagai <strong>SPDN (Badan)</strong>.
            </div>
          </div>
        </section>
      </main>
    </div>
  </div>
</template>

<script setup>
import { ref } from 'vue'

const activeTab = ref('spdn')
const tabs = ref([
  { id: 'spdn', name: 'SPDN' },
  { id: 'spln', name: 'SPLN' },
  { id: 'but', name: 'BUT' }
])

const spdnContent = ref([
  {
    title: 'Orang Pribadi',
    icon: `<svg xmlns=\"http://www.w3.org/2000/svg\" class=\"h-6 w-6 text-blue-600\" fill=\"none\" viewBox=\"0 0 24 24\" stroke=\"currentColor\"><path stroke-linecap=\"round\" stroke-linejoin=\"round\" stroke-width=\"2\" d=\"M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z\" /></svg>`,
    description: 'Orang pribadi menjadi SPDN jika memenuhi <strong>salah satu</strong> dari 3 syarat berikut:',
    points: [
      { main: 'Bertempat tinggal di Indonesia', subpoints: ['Punya tempat tinggal permanen (bukan singgah).','Tempat melakukan kegiatan sehari-hari (ekonomi, sosial).','Tempat menjalankan kebiasaan atau hobi.','Tempat domisili (lahir di Indonesia dan masih di Indonesia).'] },
      { main: 'Berada di Indonesia > 183 hari dalam jangka waktu 12 bulan (akumulatif).' },
      { main: 'Punya niat untuk bertempat tinggal di Indonesia', subpoints: ['Visa kerja, KITAS > 183 hari, atau kontrak kerja > 183 hari.','Tindakan seperti menyewa rumah atau memindahkan keluarga.'] }
    ]
  },
  {
    title: 'Badan',
    icon: `<svg xmlns=\"http://www.w3.org/2000/svg\" class=\"h-6 w-6 text-blue-600\" fill=\"none\" viewBox=\"0 0 24 24\" stroke=\"currentColor\"><path stroke-linecap=\"round\" stroke-linejoin=\"round\" stroke-width=\"2\" d=\"M19 21V5a2 2 0 00-2-2H7a2 2 0 00-2 2v16m14 0h2m-2 0h-5m-9 0H3m2 0h5M9 7h1m-1 4h1m4-4h1m-1 4h1m-5 10v-5a1 1 0 011-1h2a1 1 0 011 1v5m-4 0h4\" /></svg>`,
    description: 'Badan menjadi SPDN jika memenuhi <strong>salah satu</strong> dari 2 syarat berikut:',
    points: [
      { main: 'Didirikan di Indonesia: Didaftarkan atau dibentuk berdasarkan hukum di Indonesia.' },
      { main: 'Bertempat kedudukan di Indonesia:', subpoints: ['Kantor pusat, pusat administrasi, atau pusat keuangan ada di Indonesia.','Tempat pimpinan melakukan pengendalian.','Pengurus membuat keputusan strategis atau tinggal di Indonesia.'] }
    ]
  },
  {
    title: 'Warisan Belum Terbagi',
    icon: `<svg xmlns=\"http://www.w3.org/2000/svg\" class=\"h-6 w-6 text-blue-600\" fill=\"none\" viewBox=\"0 0 24 24\" stroke=\"currentColor\"><path stroke-linecap=\"round\" stroke-linejoin=\"round\" stroke-width=\"2\" d=\"M17 9V7a2 2 0 00-2-2H5a2 2 0 00-2 2v6a2 2 0 002 2h2m2 4h10a2 2 0 002-2v-6a2 2 0 00-2-2H9a2 2 0 00-2 2v6a2 2 0 002 2zm7-5a2 2 0 11-4 0 2 2 0 014 0z\" /></svg>`,
    description: 'Warisan yang belum terbagi diperlakukan sebagai satu kesatuan subjek pajak menggantikan yang berhak. Kewajiban pajaknya sama seperti SPDN.',
    points: []
  }
])

// Local Accordion component
import { defineComponent, ref as vueRef } from 'vue'
const Accordion = defineComponent({
  name: 'Accordion',
  props: { title: String, icon: String },
  setup(props, { slots }) {
    const isOpen = vueRef(false)
    function toggle() { isOpen.value = !isOpen.value }
    return { isOpen, toggle, props, slots }
  },
  template: `
    <div class="bg-white rounded-lg shadow-sm border border-gray-200">
      <button @click="toggle" class="w-full flex justify-between items-center p-5 text-left font-semibold text-gray-800">
        <div class="flex items-center space-x-4"><span v-html="props.icon"></span><span>{{ props.title }}</span></div>
        <svg class="w-5 h-5 transform transition-transform" :class="{ 'rotate-180': isOpen }" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7" /></svg>
      </button>
      <div class="accordion-content px-5 pb-5 text-gray-600" :class="{ 'open': isOpen }">
        <slot></slot>
      </div>
    </div>
  `
})

// register locally
const components = { Accordion }

// expose to template
;({ components })
</script>

<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap');
* { font-family: 'Inter', sans-serif; }

.accordion-content { max-height: 0; overflow: hidden; transition: max-height 0.3s ease-out; }
.accordion-content.open { max-height: 600px; transition: max-height 0.5s ease-in; }
</style>
