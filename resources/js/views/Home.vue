<template>
	<HomeCarousel/>

    <section class="px-8 py-5">
        <div class="mb-6">
            <label for="large-input" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">User name</label>
            <!-- <input type="text" v-model="name" name="name" id="name" class="block w-full p-4 text-gray-900 border border-gray-300 rounded-lg bg-gray-50 sm:text-md focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" placeholder="Name"> -->
        </div>
     <button type="button" class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 mr-2 mb-2 dark:bg-blue-600 dark:hover:bg-blue-700 focus:outline-none dark:focus:ring-blue-800" @click="addName">Save</button>
        <div class="chat card">
		    <div class="scrollable card-body" ref="hasScrolledToBottom">
	        <template v-for="message in messages">
	            <!-- <div class="message message-receive" v-if="message.user.id != ''">
	                <p>
	                    <strong class="primary-font">
	                        {{ message.user.name }} :
	                    </strong>
	                    {{ message.message }}
	                </p>
	            </div> -->
	            <div class="message message-send" >
	                <p>
	                    <strong class="primary-font">
	                        <!-- {{ message.user.name }} : -->
	                    </strong>
	                    {{ message.message }}
	                </p>
	            </div>
	        </template>
	    </div>

	    <div class="chat-form input-group">
	        <input id="btn-input" type="text" name="message" class="form-control input-sm message-" placeholder="Type your message here..." v-model="newMessage" @keyup.enter="addMessage">

	        <span class="input-group-btn">
	            <button class="btn btn-primary" id="btn-chat" @click="addMessage">
	                Send
	            </button>
	        </span>
	    </div>

	</div>
    </section>

</template>

<script>
    import { reactive, inject,ref, onMounted,onUpdated } from 'vue';
	import HomeCarousel from "@/components/carousel/HomeCarousel.vue";
	import axios from 'axios';
    export default {

        // props:['user'],
		 components :{
				HomeCarousel,
			},
        setup(props){
	    	let messages = ref([])
	    	let newMessage = ref('')
	    	let hasScrolledToBottom = ref('')

	    	onMounted(() =>{
	    		fetchMessages()
	    	})

	    	// onUpdated(() => {
	    	// 	scrollBottom()
	    	// })

	    	Echo.private('chat-channel')
	          .listen('ItemAdded', (e) => {
                    console.log(e);
                    console.log('event lisner');
                    messages.value.push({
                    message: e.message.message,
                    // user: e.user
                });
	        })



	    	const fetchMessages = async()=> {
	            axios.get('/messages').then(response => {
	                messages.value = response.data;
	            });
	        }

	        const addMessage = async()=> {
	        	let user_message = {
                    user: props.user,   
                    message: newMessage.value
                };
	            messages.value.push(user_message);
	            axios.post('/messages', user_message).then(response => {
	              console.log(response.data);
	            });
                newMessage.value = ''
	        }

	        // const scrollBottom = () =>{
	        // 	if(messages.value.length > 1){
		    //     	let el = hasScrolledToBottom.value;
	      	// 		el.scrollTop = el.scrollHeight;
	        // 	}        	
	        // }

	        return {
	        	messages,
	        	newMessage,
	        	addMessage,
	        	fetchMessages,
	        	hasScrolledToBottom
	        }
	    }
    }
</script>
