
<script setup>
import { reactive,ref, computed } from 'vue'

const  email= ref('');
const  password= ref('');

function getuser(){
   axios.get('/api/user').then(({data})=>{
                  console.log(data)
            }).catch(({response:{data}})=>{
                 console.log(data)
            })
}
async function login(){

            await axios.get('/sanctum/csrf-cookie')
            await axios.post('/login',{
                'email': email.value,
                'password': password.value
            }).then(({data})=>{
                console.log(data)
                // this.signIn()
            }).catch(({data})=>{

                 console.log(data)
            }).finally((data)=>{
                    console.log(data)
                   alert('done')
            })
}

</script>
<template>
    <section class="container mx-auto py-20">
        <div class="max-w-lg mx-auto p-5 bg-white rounded-lg shadow dark:text-gray-400 dark:bg-gray-800">
            <h1
                class="mb-4 text-4xl font-extrabold leading-none tracking-tight text-gray-900 md:text-4xl lg:text-4xl dark:text-white text-center">
                Login
            </h1>
            <form class="py-5">
                <div class="relative z-0 w-full mb-6 group">
                    <input type="email" name="floating_email" id="floating_email" v-model="email"
                        class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-blue-600 peer"
                        placeholder=" " required />
                    <label for="floating_email"
                        class="peer-focus:font-medium absolute text-sm text-gray-500 dark:text-gray-400 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:left-0 peer-focus:text-blue-600 peer-focus:dark:text-blue-500 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6">Email
                        address</label>
                </div>
                <div class="relative z-0 w-full mb-6 group">
                    <input type="password" name="floating_password" id="floating_password"  autocomplete="new-password"  v-model="password"
                        class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-blue-600 peer"
                        placeholder=" " required />
                        
                    <label for="floating_password"
                        class="peer-focus:font-medium absolute text-sm text-gray-500 dark:text-gray-400 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:left-0 peer-focus:text-blue-600 peer-focus:dark:text-blue-500 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6">Password</label>
                </div>


                <div class="flex items-center mb-4">
                    <input id="default-checkbox" type="checkbox" value=""
                        class="w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 rounded focus:ring-blue-500 dark:focus:ring-blue-600 dark:ring-offset-gray-800 focus:ring-2 dark:bg-gray-700 dark:border-gray-600" />
                    <label for="default-checkbox"
                        class="ml-2 text-sm font-medium text-gray-900 dark:text-gray-300">Remember me</label>
                </div>
                <div class="text-center">
                    <button type="submit" @click.prevent="login"
                        class="text-white d-flax justify-center bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm w-full sm:w-auto px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">
                        Submit
                    </button>

                      
                </div>
            </form>

            <button type="submit" @click="getuser"
                        class="text-white d-flax justify-center bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm w-full sm:w-auto px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">
                        get user
                    </button>
        </div>
    </section>
</template>
