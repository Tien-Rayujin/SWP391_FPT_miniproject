<template>
  <div>
    <header>
      <nav class="navbar" role="navigation" aria-label="main navigation">
        <div class="navbar-brand">
          <router-link class="navbar-item" href="https://bulma.io" to="/">
            <img src="https://bulma.io/images/bulma-logo.png" width="112" height="28" alt="Logo">
          </router-link>
        </div>
        <div class="navbar-menu">
          <div class="navbar-start">
            <router-link class="navbar-item" to="/service">Service</router-link>
            <router-link class="navbar-item" to="/facilities">Facilities</router-link>
            <router-link class="navbar-item" to="/about">About</router-link>
            <router-link class="navbar-item" href="#" name="booking" @click="patchLogin" to="/booking">Booking</router-link>
          </div>
        </div>

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
          </div>
          <div class="navbar-item">
            <div class="dropdown is-hoverable ">
              <div class="dropdown-trigger">
                <router-link  v-if="getUser?.role === 0" name="manager" @click="patchLogin" to="">
                  <img src="public/favicon.ico" alt="user"/>
                </router-link>
              </div>
              <div class="dropdown-menu" id="dropdown-menu3" role="menu">
                <div class="dropdown-content">
                  <router-link href="#" class="dropdown-item" to="">
                    Overview
                  </router-link>
                  <router-link href="#" class="dropdown-item" to="">
                    Modifiers
                  </router-link>
                  <router-link href="#" class="dropdown-item" to="">
                    Logout
                  </router-link>
                </div>
              </div>
            </div>
          </div>
        </div>
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
  padding:10px 120px;
}

</style>
