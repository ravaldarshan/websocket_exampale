import { createPinia } from 'pinia'
import auth from './modules/auth'


const pinia = createPinia()
pinia.use(auth)
// pinia.use(user)

export default pinia