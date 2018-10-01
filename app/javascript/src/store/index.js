import Vue from 'vue'
import Vuex from 'vuex'

import scheduledGames from './scheduled_games.js'
import historicalGames from './historical_games.js'
import matchups from './matchups.js'
import teams from './teams.js'

Vue.use(Vuex)

export default new Vuex.Store({
  modules: {
    scheduledGames,
    matchups,
    teams,
    historicalGames
  }
})
