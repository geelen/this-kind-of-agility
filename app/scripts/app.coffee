'use strict'

angular.module('datApp',[])
  .config ($routeProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'views/main.html'
        controller: 'MainCtrl'
      .otherwise
        redirectTo: '/'

  .value('EpisodeScreencaps', [
    "http://images4.wikia.nocookie.net/__cb20120816022607/arresteddevelopment/images/thumb/c/c9/1x01_Pilot_%2810%29.png/479px-1x01_Pilot_%2810%29.png"
    "http://images2.wikia.nocookie.net/__cb20120118045737/arresteddevelopment/images/thumb/2/28/1x02_Top_Banana_%2844%29.png/480px-1x02_Top_Banana_%2844%29.png"
    "http://images2.wikia.nocookie.net/__cb20120123071549/arresteddevelopment/images/thumb/4/42/1x03_Bringing_Up_Buster_%2837%29.png/480px-1x03_Bringing_Up_Buster_%2837%29.png"
    "http://images2.wikia.nocookie.net/__cb20120201052861/arresteddevelopment/images/thumb/e/e4/1x04_Key_Decisions_%2850%29.png/480px-1x04_Key_Decisions_%2850%29.png"
    "http://images3.wikia.nocookie.net/__cb20120205055015/arresteddevelopment/images/thumb/a/a8/1x05_Charity_Drive_%2839%29.png/480px-1x05_Charity_Drive_%2839%29.png"
    "http://images4.wikia.nocookie.net/__cb20120207030030/arresteddevelopment/images/thumb/d/d7/1x06_Visiting_Ours_%2829%29.png/480px-1x06_Visiting_Ours_%2829%29.png"
    "http://images2.wikia.nocookie.net/__cb20120209065537/arresteddevelopment/images/thumb/b/bb/1x07_In_God_We_Trust_%2845%29.png/480px-1x07_In_God_We_Trust_%2845%29.png"
    "http://images3.wikia.nocookie.net/__cb20120214160230/arresteddevelopment/images/thumb/c/cb/1x08_My_Mother_the_Car_%2848%29.png/480px-1x08_My_Mother_the_Car_%2848%29.png"
    "http://images1.wikia.nocookie.net/__cb20120219191007/arresteddevelopment/images/thumb/5/59/1x09_Storming_the_Castle_%2864%29.png/480px-1x09_Storming_the_Castle_%2864%29.png"
    "http://images4.wikia.nocookie.net/__cb20120229061751/arresteddevelopment/images/thumb/0/0f/1x10_Pier_Pressure_%2846%29.png/480px-1x10_Pier_Pressure_%2846%29.png"
    "http://images2.wikia.nocookie.net/__cb20120408205116/arresteddevelopment/images/thumb/2/2e/1x11_Public_Relations_%2828%29.png/480px-1x11_Public_Relations_%2828%29.png"
    "http://images3.wikia.nocookie.net/__cb20120412050336/arresteddevelopment/images/thumb/8/86/1x12_Marta_Complex_%2804%29.png/480px-1x12_Marta_Complex_%2804%29.png"
    "http://images1.wikia.nocookie.net/__cb20120418044435/arresteddevelopment/images/thumb/6/67/1x13_Beef_Consomme_%2837%29.png/480px-1x13_Beef_Consomme_%2837%29.png"
    "http://images4.wikia.nocookie.net/__cb20120429192749/arresteddevelopment/images/thumb/5/5b/1x14_Shock_and_Awww_%2830%29.png/480px-1x14_Shock_and_Awww_%2830%29.png"
    "http://images3.wikia.nocookie.net/__cb20120514043628/arresteddevelopment/images/thumb/b/be/1x15_Staff_Infection_%2839%29.png/480px-1x15_Staff_Infection_%2839%29.png"
    "http://images1.wikia.nocookie.net/__cb20120529061858/arresteddevelopment/images/thumb/5/57/1x16_Altar_Egos_%2825%29.png/480px-1x16_Altar_Egos_%2825%29.png"
    "http://images1.wikia.nocookie.net/__cb20120818210550/arresteddevelopment/images/thumb/5/5a/1x17_Justice_is_Blind_%2818%29.png/480px-1x17_Justice_is_Blind_%2818%29.png"
    "http://images1.wikia.nocookie.net/__cb20120819205717/arresteddevelopment/images/thumb/e/e1/1x18_Missing_Kitty_%2814%29.png/480px-1x18_Missing_Kitty_%2814%29.png"
    "http://images2.wikia.nocookie.net/__cb20120825212940/arresteddevelopment/images/thumb/d/de/1x19_Best_Man_for_the_Gob_%2855%29.png/480px-1x19_Best_Man_for_the_Gob_%2855%29.png"
    "http://images2.wikia.nocookie.net/__cb20120908164838/arresteddevelopment/images/thumb/1/1b/1x20_Whistler%27s_Mother_%2816%29.png/480px-1x20_Whistler%27s_Mother_%2816%29.png"
    "http://images3.wikia.nocookie.net/__cb20121011214341/arresteddevelopment/images/thumb/b/b5/Not_Without_My_Daughter.png/480px-Not_Without_My_Daughter.png"
    "http://images4.wikia.nocookie.net/__cb20121014180132/arresteddevelopment/images/thumb/a/a1/1x22_Let_%27Em_Eat_Cake_%2894%29.png/480px-1x22_Let_%27Em_Eat_Cake_%2894%29.png"
    "http://images3.wikia.nocookie.net/__cb20121126014959/arresteddevelopment/images/thumb/b/bb/2x01_The_One_Where_Michael_Leaves_%28003%29.png/480px-2x01_The_One_Where_Michael_Leaves_%28003%29.png"
    "http://images4.wikia.nocookie.net/__cb20121126041515/arresteddevelopment/images/thumb/f/f6/2x02_The_One_Where_They_Build_a_House_%28103%29.png/480px-2x02_The_One_Where_They_Build_a_House_%28103%29.png"
    "http://images2.wikia.nocookie.net/__cb20120123070132/arresteddevelopment/images/thumb/5/5f/Amigos%21.png/480px-Amigos%21.png"
    "http://images4.wikia.nocookie.net/__cb20121128002106/arresteddevelopment/images/thumb/4/40/2x04_Good_Grief_%2875%29.png/480px-2x04_Good_Grief_%2875%29.png"
    "http://images2.wikia.nocookie.net/__cb20121216184824/arresteddevelopment/images/thumb/1/1d/2x05_Sad_Sack_%2857%29.png/480px-2x05_Sad_Sack_%2857%29.png"
    "http://images1.wikia.nocookie.net/__cb20121216213840/arresteddevelopment/images/thumb/b/be/2x06_Afternoon_Delight_%2861%29.png/480px-2x06_Afternoon_Delight_%2861%29.png"
    "http://images1.wikia.nocookie.net/__cb20121216221704/arresteddevelopment/images/thumb/a/a3/2x07_Switch_Hitter_%2864%29.png/480px-2x07_Switch_Hitter_%2864%29.png"
    "http://images3.wikia.nocookie.net/__cb20121216223921/arresteddevelopment/images/thumb/a/ac/2x08_Queen_for_a_Day_%2830%29.png/480px-2x08_Queen_for_a_Day_%2830%29.png"
    "http://images1.wikia.nocookie.net/__cb20130105014932/arresteddevelopment/images/thumb/e/e4/2x09_Burning_Love_%2833%29.png/480px-2x09_Burning_Love_%2833%29.png"
    "http://images4.wikia.nocookie.net/__cb20130123231722/arresteddevelopment/images/thumb/1/1f/2x10_Ready%2C_Aim%2C_Marry_Me_%2842%29.png/480px-2x10_Ready%2C_Aim%2C_Marry_Me_%2842%29.png"
    "http://images3.wikia.nocookie.net/__cb20130123232914/arresteddevelopment/images/thumb/d/db/2x11_Out_on_a_Limb_%2842%29.png/480px-2x11_Out_on_a_Limb_%2842%29.png"
    "http://images3.wikia.nocookie.net/__cb20130123233402/arresteddevelopment/images/thumb/e/e7/2x12_Hand_to_God_%2817%29.png/480px-2x12_Hand_to_God_%2817%29.png"
    "http://images1.wikia.nocookie.net/__cb20130123234628/arresteddevelopment/images/thumb/0/05/2x13_Motherboy_XXX_%2807%29.png/480px-2x13_Motherboy_XXX_%2807%29.png"
    "http://images2.wikia.nocookie.net/__cb20130129170406/arresteddevelopment/images/thumb/5/5c/2x14_The_Immaculate_Election_%2897%29.png/480px-2x14_The_Immaculate_Election_%2897%29.png"
    "http://images4.wikia.nocookie.net/__cb20130202002128/arresteddevelopment/images/thumb/8/82/2x15_Sword_of_Destiny_%2861%29.png/480px-2x15_Sword_of_Destiny_%2861%29.png"
    "http://images1.wikia.nocookie.net/__cb20130202002554/arresteddevelopment/images/thumb/c/c7/2x16_Meat_the_Veals_%2826%29.png/480px-2x16_Meat_the_Veals_%2826%29.png"
    "http://images2.wikia.nocookie.net/__cb20130204205846/arresteddevelopment/images/thumb/7/72/2x17_Spring_Breakout_%2837%29.png/480px-2x17_Spring_Breakout_%2837%29.png"
    "http://images4.wikia.nocookie.net/__cb20130204213104/arresteddevelopment/images/thumb/d/dd/2x18_Righteous_Brothers_%2862%29.png/480px-2x18_Righteous_Brothers_%2862%29.png"
    "http://images2.wikia.nocookie.net/__cb20130320181624/arresteddevelopment/images/thumb/6/6a/3x01_The_Cabin_Show_%2876%29.png/480px-3x01_The_Cabin_Show_%2876%29.png"
    "http://images4.wikia.nocookie.net/__cb20120512173932/arresteddevelopment/images/thumb/d/d5/FBEO.png/480px-FBEO.png"
    "http://images3.wikia.nocookie.net/__cb20120512174512/arresteddevelopment/images/thumb/2/28/Forget-Me-Now.png/480px-Forget-Me-Now.png"
    "http://images2.wikia.nocookie.net/__cb20120512175651/arresteddevelopment/images/thumb/c/cc/Notapusy.png/480px-Notapusy.png"
    "http://images1.wikia.nocookie.net/__cb20120512180649/arresteddevelopment/images/thumb/b/bc/Mr._F.png/480px-Mr._F.png"
    "http://images3.wikia.nocookie.net/__cb20120512181325/arresteddevelopment/images/thumb/5/58/The_Ocean_Walker.png/480px-The_Ocean_Walker.png"
    "http://images1.wikia.nocookie.net/__cb20120512182036/arresteddevelopment/images/thumb/9/93/Prison_Break-In.png/480px-Prison_Break-In.png"
    "http://images3.wikia.nocookie.net/__cb20120512182922/arresteddevelopment/images/thumb/b/b5/Making_a_Stand.png/480px-Making_a_Stand.png"
    "http://images3.wikia.nocookie.net/__cb20120512183659/arresteddevelopment/images/thumb/2/2d/S.O.B.s.png/480px-S.O.B.s.png"
    "http://images3.wikia.nocookie.net/__cb20120512184043/arresteddevelopment/images/thumb/b/b9/Fakin%27_It.png/480px-Fakin%27_It.png"
    "http://images2.wikia.nocookie.net/__cb20120512184409/arresteddevelopment/images/thumb/c/ce/Family_Ties.png/480px-Family_Ties.png"
    "http://images1.wikia.nocookie.net/__cb20120512184825/arresteddevelopment/images/thumb/e/e8/Exit_Strategy.png/480px-Exit_Strategy.png"
    "http://images4.wikia.nocookie.net/__cb20130323224936/arresteddevelopment/images/thumb/b/b9/3x13_Development_Arrested_%2895%29.png/480px-3x13_Development_Arrested_%2895%29.png"
  ])

# http://arresteddevelopment.wikia.com/wiki/Category:Arrested_Development_Episodes
# as Mobile, then add jquery then
# $('figure.thumb img').map(function() { console.dir($(this).attr('data-src')) })
# skip the header and the first ep of s4

