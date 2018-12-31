<template>
  <div id="wrapper">
    <span id="logo">MEET</span>
    <form>
      <input class="form-element" type="text" placeholder="Email">
      <input class="form-element" type="text" placeholder="First name">
      <input class="form-element" type="text" placeholder="Last name">
      <input class="form-element" type="password" placeholder="Password">
      <button class="form-element">Sign up</button>
    </form>
    <router-link to="/">&#8592; Back to login</router-link>
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
form {
  display: flex;
  flex-direction: column;
  width: 25vw;
  min-width: 200px;
}
form * {
  width: 100%;
  box-sizing: border-box;
  padding: 1.5vh;
}
img {
  height: 7vh;
  width: 7vh;
}
</style>
