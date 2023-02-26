<template>
<!--    <div>-->
<!--        <<h1>Register</h1>-->

<!--        <div>-->
<!--            <label>Fullname</label>-->
<!--            <input type="text" placeholder="Nguyen Van A">-->
<!--        </div>-->

<!--        <div>-->
<!--            <label>Email</label>-->
<!--            <input type="email" placeholder="example@gmail.com">-->
<!--        </div>-->
<!--        -->
<!--        <div>-->
<!--            <label>Password</label>-->
<!--            <input type="text" placeholder="********">-->
<!--        </div>-->

<!--        <div>-->
<!--            <label>Phone</label>-->
<!--            <input type="tel" placeholder="0123456789">-->
<!--        </div>-->

<!--        <div>-->
<!--            <label>Address</label>-->
<!--            <input type="text" placeholder="9 District HCM city">-->
<!--        </div>-->

<!--        <div>-->
<!--            <input type="checkbox">-->
<!--            <label>Term and conditions</label>-->
<!--        </div>-->

<!--        <div>-->
<!--            <button type="submit">Register</button>-->
<!--        </div>>-->
<!--    </div>-->
  <form>
    <div class="hero is-fullheight">
      <div class="hero-body is-justify-content-center is-align-items-center">
        <div class="columns is-flex is-flex-direction-column box">
          <div class="column">
            <h1 class="title is-1 has-text-centered">Welcome</h1>
          </div>
          <div class="column">
            <label for="email">Email</label>
            <input class="input is-primary" type="text" placeholder="Email address">
          </div>
          <div class="column">
            <label for="email">Full-name</label>
            <input class="input is-primary" type="text" placeholder="Full-name">
          </div>
          <div class="column">
            <label for="email">Phone</label>
            <input class="input is-primary" type="text" placeholder="Phone">
          </div>
          <div class="column">
            <label for="email">Address</label>
            <input class="input is-primary" type="text" placeholder="Address">
          </div>
          <div class="column">
            <label for="Name">Password</label>
            <input class="input is-primary" type="password" placeholder="Password">
          </div>
          <div class="column">
            <label for="Name">Confirm Password</label>
            <input class="input is-primary" type="password" placeholder="Confirm Password">
          </div>
         <div class="column">
           <label class="checkbox">
             <input type="checkbox">
             I agree to the <a href="#">terms and conditions</a>
           </label>
          </div>
          <div class="column">
            <button class="button is-primary is-fullwidth" type="submit">Sign in</button>
          </div>
          <div class="has-text-centered">
            <p class="is-size-7"> Already have an account? <router-link to="" class="has-text-primary">Login</router-link>
            </p>
          </div>
        </div>
      </div>
    </div>
  </form>
</template>
<script>
export default {
    name: 'Register',

}
</script>
<style scoped>
.hero.is-fullheight {
  min-height: 90vh;
}
</style>
