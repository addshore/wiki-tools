<template>
    <div class="leaderboard__wrapper">
        <h2 class="screen__title">
            {{leaderboardLabel}}
        </h2>

        <template v-if="hasItems">
            <p class="screen__subtitle"
               v-html="subtitle"></p>

            <table class="leaderboard">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>{{$t('name')}}</th>
                        <th>{{$t('edits')}}</th>
                    </tr>
                </thead>

                <tbody>
                    <tr v-for="(row, index) in data.stats"
                        v-show="index < maxRows || showAll">
                        <td>{{index + 1}}</td>
                        <td>
                            <a v-bind:href="row.userLink"
                               target="_blank">{{row.user}}</a>
                        </td>
                        <td>{{numberWithCommas( row.edits )}}</td>
                    </tr>
                </tbody>
            </table>

            <wm-button
                v-show="!showAll && data.stats.length > maxRows"
                class="leaderboard__button"
                icon="eye"
                flair="bare"
                v-on:click="showAll = true">
                {{$t('show_all_rows')}}</wm-button>
        </template>

        <template v-if="!hasItems">
            <p class="screen__subtitle">
                {{$t('empty_leaderboard')}}
            </p>
        </template>
    </div>
</template>

<script>
    import { numberWithCommas } from '../util.js';

    export default {
        computed : {
            hasItems() {
                return this.data.total > 0;
            },

            leaderboardLabel() {
                return this.challenge ? this.$t('leaderboard') : this.$t('global_leaderboard');
            },

            subtitle() {
                const total = this.numberWithCommas(this.data.total);
                return this.$t('leaderboard_total', { total });
            }
        },

        data() {
            return {
                data : [],
                maxRows : 10,
                showAll : false
            }
        },

        methods : {
            numberWithCommas(val) {
                return numberWithCommas(val);
            }
        },

        async mounted() {
            const data = await this.$store.state.api.getLeaderboard(this.challenge);

            data.stats = data.stats.map((row) => {
                row.userLink = `https://commons.wikimedia.org/wiki/User:${row.user}`;
                return row;
            });

            this.data = data;
        },

        props : {
            challenge : {
                required : false
            }
        }
    }
</script>