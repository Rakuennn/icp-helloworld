<script setup>
import { ref } from 'vue';
import { easy_cycle_backend } from 'declarations/easy-cycle-backend/index';

let greeting = ref('');
let submittedNames = ref([]);

async function handleSubmit(e) {
  e.preventDefault();
  const target = e.target;
  const name = target.querySelector('#name').value;
  
  await easy_cycle_backend.greet(name).then((response) => {
    greeting.value = response;
  });
  
  await fetchSubmittedNames();
}

async function fetchSubmittedNames() {
  await easy_cycle_backend.getSubmittedNames().then((names) => {
    submittedNames.value = names;
  });
}
</script>

<template>
  <main>
    <img src="/logo2.svg" alt="DFINITY logo" />
    <br />
    <br />
    <form action="#" @submit="handleSubmit">
      <label for="name">Enter your name: &nbsp;</label>
      <input id="name" alt="Name" type="text" />
      <button type="submit">Click Me!</button>
    </form>
    <section id="greeting">{{ greeting }}</section>
    
    <h2>Submitted Names</h2>
    <button @click="fetchSubmittedNames">Show All Names</button>
    <ul>
      <li v-for="(name, index) in submittedNames" :key="index">{{ name }}</li>
    </ul>
  </main>
</template>

<style>
main {
  text-align: center;
  margin-top: 20px;
}
input {
  margin-right: 10px;
}
</style>
