import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import './assets/main.css'

// Ionic
import { IonicVue } from '@ionic/vue'
import '@ionic/vue/css/core.css'
import '@ionic/vue/css/normalize.css'
import '@ionic/vue/css/structure.css'
import '@ionic/vue/css/typography.css'
import '@ionic/vue/css/display.css'

const app = createApp(App)

app.use(IonicVue)
app.use(router)

router.isReady().then(() => {
	app.mount('#app')
})
