<template>
  <div>
    <form @submit="submitForm">
      <div v-if="isIncorrect">
        <p style="color: red">Incorrect email or password</p>
      </div>
      <div class="column is-8 is-offset-2 register">
        <div class="columns">
          <div class="column left">
            <h1 class="title is-1">Super Cool Website</h1>
            <h2 class="subtitle colored is-4">Lorem ipsum dolor sit amet.</h2>
            <p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Corporis ex deleniti aliquam tempora libero excepturi vero soluta odio optio sed.</p>
          </div>
          <div class="column right has-text-centered">
            <h1 class="title is-4">Sign up today</h1>
            <p class="description">Lorem ipsum dolor, sit amet consectetur adipisicing elit</p>
            <form>
              <div class="field">
                <div class="control">
                  <input class="input is-medium" type="text" placeholder="Email">
                </div>
              </div>

              <div class="field">
                <div class="control">
                  <input class="input is-medium" type="email" placeholder="Password">
                </div>
              </div>
              <button class="button is-block is-primary is-fullwidth is-medium">Sign in</button>
              <br />
            </form>
            <div class="has-text-centered">
              <p class="is-size-7"> Don't have an account? <router-link to="" class="has-text-primary">Sign up</router-link>
              </p>
            </div>
          </div>
        </div>
      </div>
    </form>
  </div>
</template>

<script>
export default {
  name: 'Login',
  data()
  {
    return {
      fields: {
        email: 'U2@gmail.com',
        password: '123456',
        remember_me: false
      },
      isIncorrect: false
    }
  },
  methods: {
    submitForm(evt)
    {
      evt.preventDefault();
      this.$store.dispatch('login', this.fields)
          .then(() => {
            this.$router.push('/account/profile')
          })
          .catch((e) => {
            console.log(e);
            this.isIncorrect = true
          }, 1000)
      console.log(this.fields);
    }
  }
}
</script>
<style scoped>
:root {
  --brandColor: hsl(166, 67%, 51%);
  --background: rgb(247, 247, 247);
  --textDark: hsla(0, 0%, 0%, 0.66);
  --textLight: hsla(0, 0%, 0%, 0.33);
}

.field:not(:last-child) {
  margin-bottom: 1rem;
}

.register {
  margin-top: 10rem;
  background: white;
  border-radius: 10px;
}

.left,
.right {
  padding: 4.5rem;
}

.left {
  border-right: 5px solid var(--background);
}

.left .title {
  font-weight: 800;
  letter-spacing: -2px;
}

.left .colored {
  color: var(--brandColor);
  font-weight: 500;
  margin-top: 1rem !important;
  letter-spacing: -1px;
}

.left p {
  color: var(--textLight);
  font-size: 1.15rem;
}

.right .title {
  font-weight: 800;
  letter-spacing: -1px;
}

.right .description {
  margin-top: 1rem;
  margin-bottom: 1rem !important;
  color: var(--textLight);
  font-size: 1.15rem;
}

.right small {
  color: var(--textLight);
}

input {
  font-size: 1rem;
}

input:focus {
  border-color: var(--brandColor) !important;
  box-shadow: 0 0 0 1px var(--brandColor) !important;
}

</style>
