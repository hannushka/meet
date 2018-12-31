<template>
  <div id="app">
    <router-view/>
  </div>
</template>

<script>
export default {
  name: 'App'
}
</script>

<style>
@import url('https://fonts.googleapis.com/css?family=Roboto');
* {
  margin: 0;
  padding: 0;
}
#app {
  font-family: 'Roboto', Helvetica, Arial, sans-serif;
}
a {
  text-decoration: none;
  color: black;
  font-size: 1.25vh;
}
</style>
