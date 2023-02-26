<template>
  <div>
    <header>
      <nav class="navbar" role="navigation" aria-label="main navigation">
        <div class="navbar-brand">
          <router-link class="navbar-item" href="https://bulma.io" to="/">
            <img src="https://bulma.io/images/bulma-logo.png" width="112" height="28">
          </router-link>
        </div>
        <div class="navbar-menu">
          <div class="navbar-start">
            <router-link class="navbar-item" to="/service">Service</router-link>
            <router-link class="navbar-item" to="/facilities">Facilities</router-link>
            <router-link class="navbar-item" to="/about">About</router-link>
            <!-- <router-link class="navbar-item" to="/login">Login</router-link> -->
            <router-link class="navbar-item" href="#" name="booking" @click="patchLogin" to="/booking">Booking</router-link>
          </div>
        </div>
        <!-- <li><router-link to="/login">Login</router-link></li> -->

        <div class="navbar-end">
          <div class="navbar-item">
            <div class="buttons">
              <router-link class="button is-primary" to="/register">
                <strong>Sign up</strong>
              </router-link>
              <router-link class="button is-light" to="/login">
                Log in
              </router-link>
            </div>
            <router-link class="navbar-item" v-if="getUser?.role === 1" name="manager" @click="patchLogin" to="">Manager</router-link>
          </div>
        </div>
        <li v-if="getUser?.role === 1"><a href="#" name="manager" @click="patchLogin">Manager</a></li>
      </nav>
    </header>
  </div>
</template>

<script>
import { mapGetters } from 'vuex';
export default {
  name: 'Header',
  computed: {
    ...mapGetters(['getUser']),
  },
  methods: {
    patchLogin(evt){
      if(this.getUser) this.$router.push('/' + evt.target.name)
      else this.$router.push('/login')
    }
  },
  created() {
    // call api to sync data
    this.$store.dispatch('getServiceItem')
    this.$store.dispatch('getReviewItem')
    this.$store.dispatch('getBirdTypeItem')
  }
}
</script>

<style scoped>
header{
  padding:10px 30px;
}
</style>
