<template>
  <div id="wrapper">
    <span id="logo">MEET</span>
    <div id="form">
      <input type="text" placeholder="Email">
      <input type="password" placeholder="Password">
      <button>Log in</button>
    </div>
    <router-link to="/sign-up">Need to sign up?</router-link>
  </div>
</template>

<script>
</script>

<style scoped>
  #wrapper {
    height: 100vh;
    display: flex;
    flex-direction: column;
    justify-content: center;
  }
  #wrapper * {
    margin: 0 auto 2vh auto;
  }
  #logo {
    font-weight: bold;
    font-size: 6vh;
  }
  #form {
    display: flex;
    flex-direction: column;
    width: 25vw;
    min-width: 200px;
  }
  #form * {
    width: 100%;
    box-sizing: border-box;
    padding: 1.5vh;
  }
</style>
