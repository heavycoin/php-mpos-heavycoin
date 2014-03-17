         <tr>
           <td colspan="2"><b><u>Network Info</u></b></td>
         </tr>
         <tr>
           <td><b>Difficulty</b></td>
           <td id="b-diff" class="right">{$NETWORK.difficulty|number_format:"8"}</td>
         </tr>
         <tr>
           <td><b>Est Next Difficulty</b></td>
           <td id="b-nextdiff" class="right">{$NETWORK.EstNextDifficulty|number_format:"8"} (Change in {$NETWORK.BlocksUntilDiffChange} Blocks)</td>
         </tr>
         <tr>
           <td><b>Est. Avg. Time per Block</b></td>
           <td id="b-esttimeperblock" class="right">{$NETWORK.EstTimePerBlock|seconds_to_words}</td>
         </tr>
         <tr>
           <td><b>Current Block</b></td>
           <td id="b-nblock" class="right">{$NETWORK.block}</td>
         </tr>

         <tr><td colspan="2">&nbsp;</td></tr>
         <tr>
           <td colspan="2"><b><u>Block Reward Voting</u></b></td>
         </tr>
         <tr>
           <td><b>Current Reward</b></td>
           <td id="b-reward" class="right">{$NETWORK.reward|number_format:"0"}</td>
         </tr>

         <tr>
           <td><b>Est Next Reward</b></td>
           <td id="b-rewardest" class="right">{$NETWORK.rewardest|number_format:"0"}</td>
         </tr>
         <tr>
           <td><b>Est Time Until Next</b></td>
           <td id="b-rewardnextwhen" class="right">{$NETWORK.rewardnextwhen|default:"Unknown"}</td>
         </tr>

         <tr>
           <td><b>Phase</b></td>
           <td id="b-phase" class="right">{$NETWORK.phase}</td>
         </tr>

         <tr><td colspan="2">&nbsp;</td></tr>
         <tr>
           <td colspan="2"><b><u>Money Supply</u></b></td>
         </tr>
         <tr>
           <td><b>Current</b></td>
           <td id="m-supply" class="right">{$NETWORK.supply|number_format:"0"}</td>
         </tr>
         <tr>
           <td><b>Max</b></td>
           <td id="m-max" class="right">{$NETWORK.mmax|number_format:"0"}</td>
         </tr>
