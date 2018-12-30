<template>
  <div class="wrapper">
    <div class="title">
      <span class="logo">MEET</span>
      <span>Your new meeting ground.</span>
    </div>
    <div class="login-form">
      <input v-model="message" placeholder="Email">
      <input v-model="message" placeholder="Password">
      <button>Log in</button>
      <p>Need to sign up?</p>
    </div>
  </div>
</template>

<script>
/* export default {
  name: 'Main',
  data () {
    return {
      // msg: 'Welcome to Your Vue.js App'
    }
  }
} */
</script>

<style scoped>
  .wrapper {
    display: flex;
    flex-direction: column;
    margin: 12em 0 0 4em;
  }
  .title {
    margin-bottom: 1em;
  }
  .logo {
    display: inline-block;
    font-weight: bold;
    font-size: 3em;
  }
  input {
    display: block;
    margin-bottom: 1em;
    width: 23em;
  }
  p {
    font-size: 0.9em;
    margin-top: 1em;
  }
</style>
