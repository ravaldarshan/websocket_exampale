
<script setup>
import { reactive,ref, computed } from 'vue'
import { useRouter } from 'vue-router'
  import { useToast } from "vue-toastification";

const  email= ref('');
const  password= ref('');
const  token= sessionStorage.getItem('token');
const router = useRouter();
 const toast = useToast();



var formerror =ref({});
function getuser(){
   axios.get('/api/user').then(({data})=>{
                  console.log(data)
            }).catch(({response:{data}})=>{
                 console.log(data)
            })
}
async function login(){
            await axios.get('/sanctum/csrf-cookie')
            await axios.post('api/login',{
                'email': email.value,
                'password': password.value
            })
            .then(resp => {
                    const options = {
                         timeout: 3000,
                         onClose: () => {
                            router.push('/')
                        }
                    }
                    sessionStorage.setItem("token", resp.data.token);
                    token.value = sessionStorage.getItem('token')
                    toast.success(resp.data.message, options);
                    notification.notify(options)
                }).catch(e => {
                    // console.log( e.response.data)
                    formerror.value = e.response.data
                });
            
}

</script>
<template>
    <section class="container mx-auto py-20">
        <div class="max-w-lg mx-auto p-5 bg-white rounded-lg shadow dark:text-gray-400 dark:bg-gray-800">
            <h1
                class="mb-4 text-4xl font-extrabold leading-none tracking-tight text-gray-900 md:text-4xl lg:text-4xl dark:text-white text-center">
                Login
            </h1>
            {{token}}
            <div id="targetElement" v-if="formerror.message" class="flex p-4 mb-4 text-green-800 border-t-4 border-green-300 bg-green-50 dark:text-green-400 dark:bg-gray-800 dark:border-green-800" role="alert">
                <svg class="flex-shrink-0 w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7-4a1 1 0 11-2 0 1 1 0 012 0zM9 9a1 1 0 000 2v3a1 1 0 001 1h1a1 1 0 100-2v-3a1 1 0 00-1-1H9z" clip-rule="evenodd"></path></svg>
                <div class="ml-3 text-sm font-medium"><strong>Oh!</strong>{{formerror.message[0]}}</div>
                <button type="button" id="triggerElement" class="ml-auto -mx-1.5 -my-1.5 bg-green-50 text-green-500 rounded-lg focus:ring-2 focus:ring-green-400 p-1.5 hover:bg-green-200 inline-flex h-8 w-8 dark:bg-gray-800 dark:text-green-400 dark:hover:bg-gray-700"  data-dismiss-target="#alert-border-3" aria-label="Close">
                <span class="sr-only">Dismiss</span>
                <svg aria-hidden="true" class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd"></path></svg>
                </button>
            </div>
          
            <form class="py-5">
                <div class="relative z-0 w-full mb-6 group">
                    <input type="email" name="floating_email" id="floating_email" v-model="email"
                        class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-blue-600 peer"
                        placeholder=" " required />
                    <label for="floating_email"
                        class="peer-focus:font-medium absolute text-sm text-gray-500 dark:text-gray-400 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:left-0 peer-focus:text-blue-600 peer-focus:dark:text-blue-500 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6">Email
                        address</label>
                        <span v-if="formerror.email">{{formerror.email[0]}}</span>
                </div>
                <div class="relative z-0 w-full mb-6 group">
                    <input type="password" name="floating_password" id="floating_password"  autocomplete="new-password"  v-model="password"
                        class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-blue-600 peer"
                        placeholder=" " required />
                        
                    <label for="floating_password"
                        class="peer-focus:font-medium absolute text-sm text-gray-500 dark:text-gray-400 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:left-0 peer-focus:text-blue-600 peer-focus:dark:text-blue-500 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6">Password</label>
                  <span v-if="formerror.password">{{formerror.password[0]}}</span>
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

            <!-- <button type="submit" @click="getuser"
                        class="text-white d-flax justify-center bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm w-full sm:w-auto px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">
                        get user
                    </button> -->
        </div>
    </section>
</template>
