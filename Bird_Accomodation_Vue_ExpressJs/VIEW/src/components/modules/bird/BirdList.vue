<template>
    <!-- page introduction -->
    <div class="container content">
        <div>
            <div class="has-text-centered">
                <h1>Bird List</h1>
                <p>ALl your bird registered will show here !</p>
            </div>
        </div><br>
        <!-- birdlist -->
        <div class="columns">
            <div class="column is-four-fifths columns is-multiline is-mobile">
                <div class="column is-one-third bird_info_contain" v-for="bird in getBirds">
                    <!-- eachbird -->
                    <Bird_Info :bird="bird" :main="true"/>
                </div>
            </div>
            <div class="column">
                <!-- register new bird -->
                <BirdRegister />
            </div>
        </div>


    </div>
</template>

<script>
import BirdRegister from './BirdRegister.vue'
import Bird_Info from './Bird_Info.vue'
import { mapGetters } from 'vuex'
export default {
    name: 'BirdList',
    computed: {
        ...mapGetters(['getUser', 'getBirds'])
    },
    components: {
        BirdRegister,
        Bird_Info
    }
}
</script>

<style scoped>

</style>