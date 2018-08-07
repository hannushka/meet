<template>
  <div class="main">
    <!-- <h1>{{ msg }}</h1> -->
    <div class="nav">
      <div class="logo">MEET</div>
      <div class="navbar">
        <font-awesome-icon icon="user-friends" />
        <font-awesome-icon icon="comments" />
        <font-awesome-icon icon="calendar" />
        <font-awesome-icon icon="plus" />
      </div>
    </div>
    <div class="sidebar">
    </div>
    <div class="content">
      content here
      <div class="post">
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'Main',
  data () {
    return {
      // msg: 'Welcome to Your Vue.js App'
    }
  }
}
</script>

<style scoped>
  .main {
    text-align: left;
  }
  .nav {
    width: 80vw;
    display: flex;
    flex-direction: row;
  }
  .logo {
    font-size: 30pt;
    font-weight: bold;
    margin-bottom: -3pt;
    margin-right: 10pt;
  }
  .navbar {
    align-self: flex-end;
    font-size: 20pt;
  }
  .content {
    margin-top: 20pt;
  }
  .sidebar {
    position: fixed;
    bottom: 0;
    right: 0;
    width: 20vw;
    height: 100vh;
    background-color: #F7F7F7;
  }
</style>
