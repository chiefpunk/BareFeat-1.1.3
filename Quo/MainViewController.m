//
//  MainViewController.m
//  Quo
//
//  Created by Valeriy Petrenko on 04/11/12.
//  Copyright (c) 2012 Larisa Petrenko. All rights reserved.
//
#import "BannerViewController.h"
#import "MainViewController.h"
//#import "slovo.h"

//#define myTimeInterval 7.0
// static sqlite3_stmt *statement = nil;
// 1    Αα	Alpha
// 2    Ββ	Beta	
// 3    Γγ	Gamma
// 4    Δδ	Delta
// 5    Εε	Epsilon
// 6    Ζζ	Zeta
// 7    Ηη	Eta
// 8    Θθ	Theta
// 9    Ιι	Iota
// 10   Κκ	Kappa
// 11   Λλ	Lambda
// 12   Μμ	Mu
// 13   Νν	Nu
// 14   Ξξ	Xi
// 15   Οο	Omicron
// 16	Ππ	Pi
// 17	Ρρ	Rho
// 18	Σσς	Sigma
// 19	Ττ	Tau
// 20	Υυ	Upsilon
// 21	Φφ	Phi
// 22	Χχ	Chi
// 23	Ψψ	Psi
// 24 	Ωω	Omega

/*
 Равенство	a == b	Да	Да	R T::operator ==(S b);	R operator ==(T a, S b);
 Неравенство	a != b	Да	Да	R T::operator !=(S b);	R operator !=(T a, S b);
 Больше	a > b	Да	Да	R T::operator >(S b);	R operator >(T a, S b);
 Меньше	a < b	Да	Да	R T::operator <(S b);	R operator <(T a, S b);
 Больше или равно	a >= b	Да	Да	R T::operator >=(S b);	R operator >=(T a, S b);
 Меньше или равно	a <= b	Да	Да	R T::operator <=(S b);	R operator <=(T a, S b);
 Логические операторы[править | править исходный текст]
 Оператор	  Синтаксис  	Перегружаемый	Реализован в Си	Пример (R, S и T обозначают тип)
 Член типа T	Определение вне класса
 Логическое отрицание NOT	!a	Да	Да	R T::operator !();	R operator !(T a);
 Логическое И	a && b	Да	Да	R T::operator &&(S b);	R operator &&(T a, S b);
 Логическое ИЛИ	a || b	Да	Да	R T::operator ||(S b);	R operator ||(T a, S b);

 
 */

@interface MainViewController ()

@end


@implementation MainViewController {
    BannerViewController *_bannerViewController;
    
}

@synthesize gameCenterManager;

@synthesize soundFileURLRef1;
@synthesize soundFileObject1;

@synthesize soundFileURLRef2;
@synthesize soundFileObject2;


@synthesize soundFileURLRef3;
@synthesize soundFileObject3;

@synthesize currentTriangle, previousTriangle, Hod; /* номер хода от 1 до 3 включительно */
@synthesize PlayFlipSound, SoundBackground, SoundFlipNumber, SoundFlipOn;;
@synthesize alertShowing, path;
@synthesize KUPLEN, TransitonFinish, BecomeActive;
@synthesize webView, touchView, greekLetter;
@synthesize slova, touchViewOnOf;
@synthesize databaseNumber, currentLanguge, zapiseyvBD, _puls;
@synthesize s1, s2;
@synthesize purchaseActivityIndicator, currentPage;
@synthesize color1triangle, color1nextTriangle, color2triangle, color2nextTriangle;
@synthesize color3triangle,color3nextTriangle, color4triangle,color4nextTriangle;
@synthesize CurrentLevel, CurrentGrade, CurrentScore, currentScoreLabel;
@synthesize lockRight1, lockBottom2;
@synthesize lockLeft3, lockTop4, OldCurrentLevel, OldCurrentGrade;
/*************************************************/
/*************************************************/

/*************************************************/

- (void) showHideLocks {
    if (CurrentGrade==1)
    {
     
        lockRight1.hidden = YES;
        lockBottom2.hidden = YES;
        lockLeft3.hidden = YES;
        lockTop4.hidden = YES;
        
        [self.webView stringByEvaluatingJavaScriptFromString: @"document.getElementById('triangle1hidden').style.visibility = 'hidden';"];
        [self.webView stringByEvaluatingJavaScriptFromString: @"document.getElementById('triangle2hidden').style.visibility = 'hidden';"];
        [self.webView stringByEvaluatingJavaScriptFromString: @"document.getElementById('triangle3hidden').style.visibility = 'hidden';"];
        [self.webView stringByEvaluatingJavaScriptFromString: @"document.getElementById('triangle4hidden').style.visibility = 'hidden';"];
        
    }
    else if (CurrentGrade==2)
    {
        [lockRight1 setImage:[UIImage imageNamed: @"zamokOpen.png"]];
        lockRight1.hidden = NO;
        lockBottom2.hidden = YES;
        lockLeft3.hidden = YES;
        lockTop4.hidden = YES;
        
        [self.webView stringByEvaluatingJavaScriptFromString: @"document.getElementById('triangle1hidden').style.visibility = 'hidden';"];
        [self.webView stringByEvaluatingJavaScriptFromString: @"document.getElementById('triangle2hidden').style.visibility = 'visible';"];
        [self.webView stringByEvaluatingJavaScriptFromString: @"document.getElementById('triangle3hidden').style.visibility = 'hidden';"];
        [self.webView stringByEvaluatingJavaScriptFromString: @"document.getElementById('triangle4hidden').style.visibility = 'hidden';"];
        
    }
    else if (CurrentGrade==3)
    {
        [lockRight1 setImage:[UIImage imageNamed: @"zamokOpen.png"]];
        [lockLeft3 setImage:[UIImage imageNamed: @"zamokOpen.png"]];

        lockRight1.hidden = NO;
        lockBottom2.hidden = YES;
        lockLeft3.hidden = NO;
        lockTop4.hidden = YES;

        
        [self.webView stringByEvaluatingJavaScriptFromString: @"document.getElementById('triangle1hidden').style.visibility = 'hidden';"];
        [self.webView stringByEvaluatingJavaScriptFromString: @"document.getElementById('triangle2hidden').style.visibility = 'visible';"];
        [self.webView stringByEvaluatingJavaScriptFromString: @"document.getElementById('triangle3hidden').style.visibility = 'hidden';"];
        [self.webView stringByEvaluatingJavaScriptFromString: @"document.getElementById('triangle4hidden').style.visibility = 'visible';"];
        
    }
    else if (CurrentGrade==4)
    {
        [lockRight1 setImage:[UIImage imageNamed: @"zamokOpen.png"]];
        [lockBottom2 setImage:[UIImage imageNamed: @"zamokOpen.png"]];
        [lockLeft3 setImage:[UIImage imageNamed: @"zamokOpen.png"]];
        
        lockRight1.hidden = NO;
        lockBottom2.hidden = NO;
        lockLeft3.hidden = NO;
        lockTop4.hidden = YES;
        
        
        [self.webView stringByEvaluatingJavaScriptFromString: @"document.getElementById('triangle1hidden').style.visibility = 'hidden';"];
        [self.webView stringByEvaluatingJavaScriptFromString: @"document.getElementById('triangle2hidden').style.visibility = 'visible';"];
        [self.webView stringByEvaluatingJavaScriptFromString: @"document.getElementById('triangle3hidden').style.visibility = 'visible';"];
        [self.webView stringByEvaluatingJavaScriptFromString: @"document.getElementById('triangle4hidden').style.visibility = 'visible';"];
        
    } else if (CurrentGrade==5)
    {
        [lockRight1 setImage:[UIImage imageNamed: @"zamok.png"]];
     
        
        lockRight1.hidden = NO;
        lockBottom2.hidden = YES;
        lockLeft3.hidden = YES;
        lockTop4.hidden = YES;
        
        
        [self.webView stringByEvaluatingJavaScriptFromString: @"document.getElementById('triangle1hidden').style.visibility = 'hidden';"];
        [self.webView stringByEvaluatingJavaScriptFromString: @"document.getElementById('triangle2hidden').style.visibility = 'visible';"];
        [self.webView stringByEvaluatingJavaScriptFromString: @"document.getElementById('triangle3hidden').style.visibility = 'hidden';"];
        [self.webView stringByEvaluatingJavaScriptFromString: @"document.getElementById('triangle4hidden').style.visibility = 'hidden';"];
        
    }
    else if (CurrentGrade==6)
    //Правый закрытый замок и левый открытый замок
    {
        [lockRight1 setImage:[UIImage imageNamed: @"zamok.png"]];
         [lockLeft3 setImage:[UIImage imageNamed: @"zamokOpen.png"]];
        
        lockRight1.hidden = NO;
        lockBottom2.hidden = YES;
        lockLeft3.hidden = NO;
        lockTop4.hidden = YES;
        
        
        [self.webView stringByEvaluatingJavaScriptFromString: @"document.getElementById('triangle1hidden').style.visibility = 'hidden';"];
        [self.webView stringByEvaluatingJavaScriptFromString: @"document.getElementById('triangle2hidden').style.visibility = 'visible';"];
        [self.webView stringByEvaluatingJavaScriptFromString: @"document.getElementById('triangle3hidden').style.visibility = 'hidden';"];
        [self.webView stringByEvaluatingJavaScriptFromString: @"document.getElementById('triangle4hidden').style.visibility = 'visible';"];
        
    }
    else if (CurrentGrade==7)
        // Правый закрытый замок,  нижний и левый - открытые замки
    {
        [lockRight1 setImage:[UIImage imageNamed: @"zamok.png"]];
        [lockBottom2 setImage:[UIImage imageNamed: @"zamokOpen.png"]];
        [lockLeft3 setImage:[UIImage imageNamed: @"zamokOpen.png"]];
        
        lockRight1.hidden = NO;
        lockBottom2.hidden = NO;
        lockLeft3.hidden = NO;
        lockTop4.hidden = YES;
        
        
        [self.webView stringByEvaluatingJavaScriptFromString: @"document.getElementById('triangle1hidden').style.visibility = 'hidden';"];
        [self.webView stringByEvaluatingJavaScriptFromString: @"document.getElementById('triangle2hidden').style.visibility = 'visible';"];
        [self.webView stringByEvaluatingJavaScriptFromString: @"document.getElementById('triangle3hidden').style.visibility = 'visible';"];
        [self.webView stringByEvaluatingJavaScriptFromString: @"document.getElementById('triangle4hidden').style.visibility = 'visible';"];
    }
    else if (CurrentGrade==8)
        // Правый и левый закрытые замки
    {
        [lockRight1 setImage:[UIImage imageNamed: @"zamok.png"]];
        
        [lockLeft3 setImage:[UIImage imageNamed: @"zamok.png"]];
        
        lockRight1.hidden = NO;
        lockBottom2.hidden = YES;
        lockLeft3.hidden = NO;
        lockTop4.hidden = YES;
        
        
        [self.webView stringByEvaluatingJavaScriptFromString: @"document.getElementById('triangle1hidden').style.visibility = 'hidden';"];
        [self.webView stringByEvaluatingJavaScriptFromString: @"document.getElementById('triangle2hidden').style.visibility = 'visible';"];
        [self.webView stringByEvaluatingJavaScriptFromString: @"document.getElementById('triangle3hidden').style.visibility = 'hidden';"];
        [self.webView stringByEvaluatingJavaScriptFromString: @"document.getElementById('triangle4hidden').style.visibility = 'visible';"];
    }
    else if (CurrentGrade==9)
      // Правый и левый закрытые замки, нижний открытый замок
    {
        [lockRight1 setImage:[UIImage imageNamed: @"zamok.png"]];
        
        [lockBottom2 setImage:[UIImage imageNamed: @"zamokOpen.png"]];

        [lockLeft3 setImage:[UIImage imageNamed: @"zamok.png"]];
        
        lockRight1.hidden = NO;
        lockBottom2.hidden = NO;
        lockLeft3.hidden = NO;
        lockTop4.hidden = YES;
        
        
        [self.webView stringByEvaluatingJavaScriptFromString: @"document.getElementById('triangle1hidden').style.visibility = 'hidden';"];
        [self.webView stringByEvaluatingJavaScriptFromString: @"document.getElementById('triangle2hidden').style.visibility = 'visible';"];
        [self.webView stringByEvaluatingJavaScriptFromString: @"document.getElementById('triangle3hidden').style.visibility = 'visible';"];
        [self.webView stringByEvaluatingJavaScriptFromString: @"document.getElementById('triangle4hidden').style.visibility = 'visible';"];
    }
    else if (CurrentGrade==10)
        // Все - открытые замки
    {
        [lockRight1 setImage:[UIImage imageNamed: @"zamokOpen.png"]];
        [lockBottom2 setImage:[UIImage imageNamed: @"zamokOpen.png"]];
        [lockLeft3 setImage:[UIImage imageNamed: @"zamokOpen.png"]];
        [lockTop4 setImage:[UIImage imageNamed: @"zamokOpen.png"]];
        
        lockRight1.hidden = NO;
        lockBottom2.hidden = NO;
        lockLeft3.hidden = NO;
        lockTop4.hidden = NO;
        
        
        [self.webView stringByEvaluatingJavaScriptFromString: @"document.getElementById('triangle1hidden').style.visibility = 'visible';"];
        [self.webView stringByEvaluatingJavaScriptFromString: @"document.getElementById('triangle2hidden').style.visibility = 'visible';"];
        [self.webView stringByEvaluatingJavaScriptFromString: @"document.getElementById('triangle3hidden').style.visibility = 'visible';"];
        [self.webView stringByEvaluatingJavaScriptFromString: @"document.getElementById('triangle4hidden').style.visibility = 'visible';"];
    }

    else if (CurrentGrade==11)
        //  Правый закрытый замок, остальные - открытые замки
    {
        [lockRight1 setImage:[UIImage imageNamed: @"zamok.png"]];
        [lockBottom2 setImage:[UIImage imageNamed: @"zamokOpen.png"]];
        [lockLeft3 setImage:[UIImage imageNamed: @"zamokOpen.png"]];
        [lockTop4 setImage:[UIImage imageNamed: @"zamokOpen.png"]];
        
        lockRight1.hidden = NO;
        lockBottom2.hidden = NO;
        lockLeft3.hidden = NO;
        lockTop4.hidden = NO;
        
        
        [self.webView stringByEvaluatingJavaScriptFromString: @"document.getElementById('triangle1hidden').style.visibility = 'visible';"];
        [self.webView stringByEvaluatingJavaScriptFromString: @"document.getElementById('triangle2hidden').style.visibility = 'visible';"];
        [self.webView stringByEvaluatingJavaScriptFromString: @"document.getElementById('triangle3hidden').style.visibility = 'visible';"];
        [self.webView stringByEvaluatingJavaScriptFromString: @"document.getElementById('triangle4hidden').style.visibility = 'visible';"];
    }
    else if (CurrentGrade==12)
        //Правый и левый закрытые замки, остальные - открытые замки
    {
        [lockRight1 setImage:[UIImage imageNamed: @"zamok.png"]];
        [lockBottom2 setImage:[UIImage imageNamed: @"zamokOpen.png"]];
        [lockLeft3 setImage:[UIImage imageNamed: @"zamok.png.png"]];
        [lockTop4 setImage:[UIImage imageNamed: @"zamokOpen.png"]];
        
        lockRight1.hidden = NO;
        lockBottom2.hidden = NO;
        lockLeft3.hidden = NO;
        lockTop4.hidden = NO;
        
        
        [self.webView stringByEvaluatingJavaScriptFromString: @"document.getElementById('triangle1hidden').style.visibility = 'visible';"];
        [self.webView stringByEvaluatingJavaScriptFromString: @"document.getElementById('triangle2hidden').style.visibility = 'visible';"];
        [self.webView stringByEvaluatingJavaScriptFromString: @"document.getElementById('triangle3hidden').style.visibility = 'visible';"];
        [self.webView stringByEvaluatingJavaScriptFromString: @"document.getElementById('triangle4hidden').style.visibility = 'visible';"];
    }
    else if (CurrentGrade==13)
        // Правый, нижний, левый - закрытые замки
    {
        [lockRight1 setImage:[UIImage imageNamed: @"zamok.png"]];
        [lockBottom2 setImage:[UIImage imageNamed: @"zamok.png"]];
        [lockLeft3 setImage:[UIImage imageNamed: @"zamok.png.png"]];
        [lockTop4 setImage:[UIImage imageNamed: @"zamokOpen.png"]];
        
        lockRight1.hidden = NO;
        lockBottom2.hidden = NO;
        lockLeft3.hidden = NO;
        lockTop4.hidden = YES;
        
        
        [self.webView stringByEvaluatingJavaScriptFromString: @"document.getElementById('triangle1hidden').style.visibility = 'hidden';"];
        [self.webView stringByEvaluatingJavaScriptFromString: @"document.getElementById('triangle2hidden').style.visibility = 'visible';"];
        [self.webView stringByEvaluatingJavaScriptFromString: @"document.getElementById('triangle3hidden').style.visibility = 'visible';"];
        [self.webView stringByEvaluatingJavaScriptFromString: @"document.getElementById('triangle4hidden').style.visibility = 'visible';"];
    }
    else if (CurrentGrade==14)
        // Правый, нижний, левый - закрытые замки
    {
        [lockRight1 setImage:[UIImage imageNamed: @"zamok.png"]];
        [lockBottom2 setImage:[UIImage imageNamed: @"zamok.png"]];
        [lockLeft3 setImage:[UIImage imageNamed: @"zamok.png.png"]];
        [lockTop4 setImage:[UIImage imageNamed: @"zamokOpen.png"]];
        
        lockRight1.hidden = NO;
        lockBottom2.hidden = NO;
        lockLeft3.hidden = NO;
        lockTop4.hidden = NO;
        
        
        [self.webView stringByEvaluatingJavaScriptFromString: @"document.getElementById('triangle1hidden').style.visibility = 'visible';"];
        [self.webView stringByEvaluatingJavaScriptFromString: @"document.getElementById('triangle2hidden').style.visibility = 'visible';"];
        [self.webView stringByEvaluatingJavaScriptFromString: @"document.getElementById('triangle3hidden').style.visibility = 'visible';"];
        [self.webView stringByEvaluatingJavaScriptFromString: @"document.getElementById('triangle4hidden').style.visibility = 'visible';"];
    }

}    
- (void) resetAfterFinishLevel {
    
    //////NSLog(@"%@", @"* resetAfterFinishLevel");
    
  [self.webView stringByEvaluatingJavaScriptFromString: @"newLevel()"];
}

/*************************************************/

- (NSString*)setLevelLetter {
 //////NSLog(@"%@", @"* setLevelLetter");
    
NSArray *greekLetters = [NSArray arrayWithObjects: @"α", @"β", @"γ", @"δ",  @"ε",  @"ζ",  @"η", @"θ",  @" ι",  @"κ",  @"λ",  @"μ",  @"ν",  @"ξ",  @"ο",  @"π",  @"ρ",
                          @"ς",  @"τ",  @"υ",  @"φ",  @"χ",  @"ψ",  @"ω", nil];

    greekLetter.titleLabel.text = [greekLetters objectAtIndex: CurrentLevel-1];
    [greekLetter setTitle:[greekLetters objectAtIndex: CurrentLevel-1] forState:UIControlStateHighlighted];
    
    [greekLetter setTitle:[greekLetters objectAtIndex: CurrentLevel-1] forState:UIControlStateNormal];
    
    [greekLetter setTitle:[greekLetters objectAtIndex: CurrentLevel-1] forState:UIControlStateSelected];

    greekLetter.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    return greekLetter.titleLabel.text;
}
/*************************************************/


- (void) setNewLevelColors {
    //////NSLog(@"%@", @"* setNewLevelColors");

    if (CurrentLevel==1) {
    color1triangle = 1;
    color1nextTriangle = 5;
    color2triangle = 2;
    color2nextTriangle = 1;
    color3triangle = 3;
    color3nextTriangle = 6;
    color4triangle = 4;
    color4nextTriangle = 6;
    }
    else  {
        color1triangle = [self randomColor];
        color2triangle =  [self randomColor];
        while (color1triangle==color2triangle) {
             color2triangle =  [self randomColor];
        }
        color3triangle =  [self randomColor];
        while ((color3triangle==color2triangle) || (color3triangle==color1triangle)) {
            color3triangle =  [self randomColor];
        }
        color4triangle = [self randomColor];
        while ((color3triangle==color4triangle) || (color4triangle==color2triangle)|| (color4triangle==color1triangle)) {
            color4triangle =  [self randomColor];
        }
        
        color1nextTriangle = [self randomColor];
        while (color1nextTriangle==color4triangle) {
            color1nextTriangle =  [self randomColor];
        }
        color2nextTriangle = [self randomColor];
        while (color1nextTriangle==color2nextTriangle) {
            color2nextTriangle =  [self randomColor];
        }
        
        color3nextTriangle = [self randomColor];
        while (color3nextTriangle==color2nextTriangle) {
            color3nextTriangle =  [self randomColor];
        }
        
         color4nextTriangle = [self randomColor];
    }
    
   [self ColorsListing];
   // [self.webView stringByEvaluatingJavaScriptFromString: @"newLevel()"];

     // 1 triangle1
   NSString *JavaCom = [NSString stringWithFormat:@"document.getElementById('triangle1').style.borderTop='140px solid %@';",  [self ourColors:color1triangle]];
    [webView stringByEvaluatingJavaScriptFromString:JavaCom];
    //////NSLog(@"triangle1 = %@", JavaCom);
    
     // 2 color1nextTriangle
    JavaCom = [NSString stringWithFormat:@"document.getElementById('triangle1next').style.borderTop='140px solid %@';",  [self ourColors:color1nextTriangle]];
    [webView stringByEvaluatingJavaScriptFromString:JavaCom];
    //////NSLog(@"color1nextTriangle = %@", JavaCom);
    

    
     // 3 color2triangle
    JavaCom = [NSString stringWithFormat:@"document.getElementById('triangle2').style.borderRight='140px solid %@';",  [self ourColors:color2triangle]];
    [webView stringByEvaluatingJavaScriptFromString:JavaCom];
    //////NSLog(@"color2triangle = %@", JavaCom);
    
    
     // 4 color2nextTriangle
    JavaCom = [NSString stringWithFormat:@"document.getElementById('triangle2next').style.borderRight='140px solid %@';",  [self ourColors:color2nextTriangle]];
    [webView stringByEvaluatingJavaScriptFromString:JavaCom];
    //////NSLog(@"color2nextTriangle = %@", JavaCom);
    
     // 5 color3triangle
    JavaCom = [NSString stringWithFormat:@"document.getElementById('triangle3').style.borderBottom='140px solid %@';",  [self ourColors:color3triangle]];
    [webView stringByEvaluatingJavaScriptFromString:JavaCom];
    //////NSLog(@"color3triangle = %@", JavaCom);
    
    
     // 6 color3nextTriangle
    JavaCom = [NSString stringWithFormat:@"document.getElementById('triangle3next').style.borderBottom='140px solid %@';",  [self ourColors:color3nextTriangle]];
    [webView stringByEvaluatingJavaScriptFromString:JavaCom];
    //////NSLog(@"color3nextTriangle = %@", JavaCom);
    

     // 7 triangle4
    
    JavaCom = [NSString stringWithFormat:@"document.getElementById('triangle4').style.borderLeft='140px solid %@';",  [self ourColors:color4triangle]];
    [webView stringByEvaluatingJavaScriptFromString:JavaCom];
    //////NSLog(@"JavaCom 3 = %@", JavaCom);
    
     // 8 color4nextTriangle
   JavaCom = [NSString stringWithFormat:@"document.getElementById('triangle4next').style.borderLeft='140px solid %@';",  [self ourColors:color4nextTriangle]];
    [webView stringByEvaluatingJavaScriptFromString:JavaCom];
    //////NSLog(@"triangle4next = %@", JavaCom);
     // FINISH set 8 color4nextTriangle
    
    
    //////NSLog(@"%@", @"* FINISH setNewLevelColors");
}


/*************************************************/

- (void) newLevelStart {
    //////NSLog(@"%@", @"* newLevelStart");
    lockRight1.hidden = YES;
    lockBottom2.hidden = YES;
    lockLeft3.hidden = YES;
    lockTop4.hidden = YES;
    
    [self.webView stringByEvaluatingJavaScriptFromString: @"document.getElementById('triangle1hidden').style.visibility = 'hidden';"];
    [self.webView stringByEvaluatingJavaScriptFromString: @"document.getElementById('triangle2hidden').style.visibility = 'hidden';"];
    [self.webView stringByEvaluatingJavaScriptFromString: @"document.getElementById('triangle3hidden').style.visibility = 'hidden';"];
    [self.webView stringByEvaluatingJavaScriptFromString: @"document.getElementById('triangle4hidden').style.visibility = 'hidden';"];
    
    
    
    AppDelegate *appDelegate=  (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [appDelegate myAudioPlayer2];
    [self.webView stringByEvaluatingJavaScriptFromString: @"growDiv()"];
    
    
   
  //  [self.webView stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"moveScore('+%d')",  [self CurrentScore]]];
    
 
    
  [self.webView stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"moveLevel('%@')",  [self setLevelLetter]]];
    
    
    
    
    [self setNewLevelColors];
    
    currentTriangle = 0;
    previousTriangle  = 0;
    
  
    
    
  [self.webView stringByEvaluatingJavaScriptFromString: @"newLevel2()"];
   // [self setLevelLetter];
 [self performSelector:@selector(resetAfterFinishLevel) withObject:nil afterDelay:3.1];
 [self performSelector:@selector(showHideLocks) withObject:nil afterDelay:3.1];
 
    
}
/*************************************************/
- (void) CheckLevelFinish {
      ////NSLog(@"%@", @"* CheckLevelFinish");

    
    
    [self ColorsListing];
    
    if ((color1triangle==color2triangle)&&(color2triangle==color4triangle)&&(color1triangle==color3triangle)){
      ////NSLog(@"CheckLevelFinish = %@", @"CheckLevelFinish function");
    CurrentLevel = CurrentLevel + 1;
             if (CurrentLevel>24)
             {
                CurrentLevel=1;
                CurrentGrade=CurrentGrade+1;
                 if (CurrentGrade>5)
                 {
                     CurrentGrade=1;
      
                   
                 }
                     [self  showHideLocks];
                 
                 [[NSUserDefaults standardUserDefaults] setInteger:CurrentGrade forKey:@"CurrentGrade"];
             }
        
        
        
        //////NSLog(@"1 CurrentScore %d", CurrentScore);
        CurrentScore=CurrentScore+ (CurrentGrade * 100);
        
        if ((CurrentGrade * 100)>999)  {
             [self.webView stringByEvaluatingJavaScriptFromString:@"document.getElementById('scoreText').style.fontSize = '100px';"];
             } else
             {[self.webView stringByEvaluatingJavaScriptFromString:@"document.getElementById('scoreText').style.fontSize = '130px';"];
             }
        currentScoreLabel.text =  [NSString stringWithFormat:@"%d", CurrentScore];
        //////NSLog(@"2 CurrentScore %d", CurrentScore);
        if (CurrentScore == 100)  {
            currentScoreLabel.text =  [NSString stringWithFormat:@"%@", NSLocalizedString(@"Collect one color", nil) ];
        }
        
        [[NSUserDefaults standardUserDefaults] setInteger:CurrentScore forKey:@"CurrentScore"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        [self.webView stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"moveScore('+%d')",  (CurrentGrade * 100)]];
        

    [self newLevelStart];        
    [[NSUserDefaults standardUserDefaults] setInteger:CurrentLevel forKey:@"CurrentLevel"];
    [[NSUserDefaults standardUserDefaults] synchronize];
     //////NSLog(@"Current Level = %i", CurrentLevel);
    
    //////NSLog(@"CurrentGrade  = %i", CurrentGrade);
    
    }
    //сохранить измененный цвет в NSUserDefaults
    //ресет левел
    //ресет game
   
    else   ;//////NSLog(@"%@", @"NOT FINISH in CurrentLevel");
}


/*************************************************/



- (void) SystemSoundServices {
    
    //////NSLog(@"**************");
    //////NSLog(@"*****SystemSoundServices*********");
    //////NSLog(@"**************");
   
    
    NSURL *tapSound   = [[NSBundle mainBundle] URLForResource: @"BimBom2"
                                                withExtension: @"caf"];
    
    // Store the URL as a CFURLRef instance
    self.soundFileURLRef1 = (CFURLRef) [tapSound retain];
    
    // Create a system sound object representing the sound file.
    AudioServicesCreateSystemSoundID (
                                      
                                      soundFileURLRef1,
                                      &soundFileObject1
                                      );
    
    NSURL *tapSound2   = [[NSBundle mainBundle] URLForResource: @"tap-flip"
                                                withExtension: @"caf"];
    
    // Store the URL as a CFURLRef instance
    self.soundFileURLRef2 = (CFURLRef) [tapSound2 retain];
    
    // Create a system sound object representing the sound file.
    AudioServicesCreateSystemSoundID (
                                      
                                      soundFileURLRef2,
                                      &soundFileObject2
                                      );
    
    NSURL *tapSound3   = [[NSBundle mainBundle] URLForResource: @"blocked"
                                                 withExtension: @"aiff"];
    
    // Store the URL as a CFURLRef instance
    self.soundFileURLRef3 = (CFURLRef) [tapSound3 retain];
    
    // Create a system sound object representing the sound file.
    AudioServicesCreateSystemSoundID (
                                      
                                      soundFileURLRef3,
                                      &soundFileObject3
                                      );
}


/*********** END SystemSoundServices *********************/

/*************************************************/

// Respond to a tap on the System Sound button.
- (IBAction) playSystemSound1: (id) sender {
    
    AudioServicesPlaySystemSound (soundFileObject1);
}
/*********** END playSystemSound1 *********************/


// Respond to a tap on the System Sound button.
- (IBAction) playSystemSound2: (id) sender {
    
    AudioServicesPlaySystemSound (soundFileObject2);
}



// Respond to a tap on the System Sound button.
- (IBAction) playSystemSoundBloked: (id) sender {
    
    AudioServicesPlaySystemSound (soundFileObject3);
}
/*********** END playSystemSound2 *********************/
    
- (void) playSystemSound3 {
    //////NSLog(@"**************");
     //////NSLog(@"**************");
     //////NSLog(@"***** playSystemSound3 *********");
    if (PlayFlipSound) {
    
  int  i=0;
     i =  (int)[[NSUserDefaults standardUserDefaults] integerForKey:@"currentFlip"];
    
    if (i==0) {
        //////NSLog(@"***** i=0 *********");
    AudioServicesPlaySystemSound (soundFileObject1);
    } else {
        
        //////NSLog(@"***** i=1 *********");
        AudioServicesPlaySystemSound (soundFileObject2);
    }
         }
}
/*********** END playSystemSound1 *********************/

//Распечатка цветов
//**************************/
- (void)ColorsListing {
    //////NSLog(@"1 Triangle Color = %i", color1triangle);
    
    //////NSLog(@"2 Triangle Color = %i", color2triangle);
     ////NSLog(@"3 Triangle Color = %i", color3triangle);
    
    
     ////NSLog(@"4 Triangle Color = %i", color4triangle);
    
     ////NSLog(@"1 Next Tr  Color = %i", color1nextTriangle);
   ////NSLog(@"2 Next Tr  Color = %i", color2nextTriangle);
  
    ////NSLog(@"3 Next Tr  Color = %i", color3nextTriangle);
    ////NSLog(@"4 Next Tr  Color = %i", color4nextTriangle);
    
}
/*************************************************/
- (int)randomColor {
     int randomValue = arc4random_uniform(CurrentLevel+5) + 1;
    //////NSLog(@"randomColor = %i", randomValue);
     return randomValue;
}
/*********** END randomColor *********************/

- (NSString*)ourColors:(int)numberOfCOLOR {
NSString* ourColorsSTRING = @"#fc7c7e";
    switch(numberOfCOLOR) {
        case 1:
        {
            ourColorsSTRING =    @"#fc7c7e";
            break;
        }
        case 2:
        {
            ourColorsSTRING =    @"#83c9fd";
            break;
        }
        case 3:
        {
            ourColorsSTRING =    @"#f4e443";
            break;
        }
            
        case 4:
        {
            ourColorsSTRING =    @"#b5df36";
            break;
        }
        case 5:
        {
            ourColorsSTRING =    @"#f9ad2a";
            break;
        }
        case 6:
        {
            ourColorsSTRING =    @"#e3a8fd";
            break;
        }
        case 7:
        {
            ourColorsSTRING =    @"#D2B48C";
            break;
        }
        case 8:
        { // v 
            ourColorsSTRING = @"#FFCCCC";
            break;
        }
        case 9:
        { //
            ourColorsSTRING = @"#99CCCC";
            break;
        }
        case 10:
        { // Chartreuse 
            ourColorsSTRING =     @"#FF00FF";
            break;
        }
        case 11:
        { // YellowGreen 
            ourColorsSTRING =    @"#9ACD32";
            break;
        }
        case 12:  
        { // Wheat 
            ourColorsSTRING =    @"#40E0D0";
            break;
        }
        case 13:
        { // White 
            ourColorsSTRING = @"#9900CC";
            break;
        }
        case 14:
        { // SpringGreen
            ourColorsSTRING =    @"#c8c8c8";
            break;
        }
        case 15:
        { // SteelBlue 	 
            ourColorsSTRING =    @"#4682B4";
            break;
        }
        case 16:
        { // Tan
            ourColorsSTRING =   @"#F5DEB3";
            break;
        }
        case 17:
        { //  Teal 	 
            ourColorsSTRING =    @"#008080";
            break;
        }
        case 18:
        { // Thistle 	
            ourColorsSTRING =    @"#D8BFD8";
            break;
        }
        case 19:
        { // Tomato 	
            ourColorsSTRING =    @"#FF6347";
            break;
        }
        case 20:
        { //  Turquoise 
            ourColorsSTRING =  @"#FF99CC";

            break;
        }
        case 21:
        { // Violet 	
            ourColorsSTRING =    @"#EE82EE";
            break;
        }
        case 22:
        { // Wheat 	
            ourColorsSTRING =    @"#00FFFF";
            break;
        }
        case 23:
        { // White 	
            ourColorsSTRING = @"#00FF7F";  
            break;
        }
        case 24:
        { //  Yellow 		  	 
            ourColorsSTRING =    @"#FFFF00";
            break;
        }
             
        case 25:
        { //     	
            ourColorsSTRING =     @"#8A2BE2";

            break;
        }
        case 26:
        { //  WhiteSmoke
            ourColorsSTRING =    @"#F5F5F5";
            break;
        }
        case 27:
        { //  WhiteSmoke
            ourColorsSTRING =    @"#CC9999"; 
            break;
        }
        case 28:

        { //  WhiteSmoke
            ourColorsSTRING =   @"#7FFF00"; 
            break;
        }
    }  //
    return ourColorsSTRING;
}
/*********** END ourColors ***************/
- (void)HodChetvergoTreugolnika {
    //////NSLog(@"********** HodChetvergoTreugolnika");
    
    NSString *JavaCom = @"document.getElementById('triangle4').style['-webkit-transition-duration'] = '0';";
    [webView stringByEvaluatingJavaScriptFromString:JavaCom];
    //////NSLog(@"JavaCom 2= %@" , JavaCom);
    [self ColorsListing];
    
    
    if (Hod == 1)
    {
        
        //////NSLog(@"********** HodChetvergoTreugolnika 1" );
        
        color1triangle = color4triangle ;
        JavaCom = [NSString stringWithFormat:@"document.getElementById('triangle1').style.borderTop='140px solid %@';",  [self ourColors:color1triangle]];
        [webView stringByEvaluatingJavaScriptFromString:JavaCom];
        //////NSLog(@"JavaCom = %@", JavaCom);
        
        
        [self ColorsListing];
        
        // 1 triangle not visible
        JavaCom = @"document.getElementById('triangle4').visibility='hidden';";
        [webView stringByEvaluatingJavaScriptFromString:JavaCom];
        //////NSLog(@"JavaCom 2= %@" , JavaCom);
        
        
        [self ColorsListing];
        
        JavaCom = @" document.getElementsByClassName('triangle4')[0].classList.remove('flipCard10');";
        
        [webView stringByEvaluatingJavaScriptFromString:JavaCom];
        //////NSLog(@"JavaCom 2a= %@" , JavaCom);
        
        
        [self ColorsListing];
        
        
        
        color4triangle = color4nextTriangle;

        JavaCom = [NSString stringWithFormat:@"document.getElementById('triangle4').style.borderLeft='140px solid %@';",  [self ourColors:color4triangle]];
        [webView stringByEvaluatingJavaScriptFromString:JavaCom];
        //////NSLog(@"JavaCom 3 = %@", JavaCom);
[self ColorsListing];
color4nextTriangle = [self randomColor];
        JavaCom = [NSString stringWithFormat:@"document.getElementById('triangle4next').style.borderLeft='140px solid %@';",  [self ourColors:color4nextTriangle]];
        [webView stringByEvaluatingJavaScriptFromString:JavaCom];
        //////NSLog(@"JavaCom 6 = %@", JavaCom);
        
        
        [self ColorsListing];
        
        JavaCom = @"document.getElementById('triangle4').visibility='visible';";
        [webView stringByEvaluatingJavaScriptFromString:JavaCom];
        //////NSLog(@"JavaCom 5= %@" , JavaCom);
        [self ColorsListing];
        
        
        
    }
    else if (Hod == 2)
    {
        //////NSLog(@"********** HodChetvergoTreugolnika 2");
       
        color2triangle = color4triangle ;
        JavaCom = [NSString stringWithFormat:@"document.getElementById('triangle2').style.borderRight='140px solid %@';",  [self ourColors:color2triangle]];
        [webView stringByEvaluatingJavaScriptFromString:JavaCom];
        //////NSLog(@"JavaCom = %@", JavaCom);
        
        
        [self ColorsListing];
        
        // 1 triangle not visible
        JavaCom = @"document.getElementById('triangle4').visibility='hidden';";
        [webView stringByEvaluatingJavaScriptFromString:JavaCom];
        //////NSLog(@"JavaCom 2= %@" , JavaCom);
        
        
        [self ColorsListing];
        
        JavaCom = @" document.getElementsByClassName('triangle4')[0].classList.remove('flipCard11');";
        
        [webView stringByEvaluatingJavaScriptFromString:JavaCom];
        //////NSLog(@"JavaCom 2a= %@" , JavaCom);
        
        
        [self ColorsListing];
        
        
        color4triangle = color4nextTriangle;
        JavaCom = [NSString stringWithFormat:@"document.getElementById('triangle4').style.borderLeft='140px solid %@';",  [self ourColors:color4triangle]];
        [webView stringByEvaluatingJavaScriptFromString:JavaCom];
        //////NSLog(@"JavaCom 3 = %@", JavaCom);
        
        
        [self ColorsListing];
        
        
        
        color4nextTriangle = [self randomColor];
        JavaCom = [NSString stringWithFormat:@"document.getElementById('triangle4next').style.borderLeft='140px solid %@';",  [self ourColors:color4nextTriangle]];
        [webView stringByEvaluatingJavaScriptFromString:JavaCom];
        //////NSLog(@"JavaCom 6 = %@", JavaCom);
        
        
        [self ColorsListing];
        
        JavaCom = @"document.getElementById('triangle4').visibility='visible';";
        [webView stringByEvaluatingJavaScriptFromString:JavaCom];
        //////NSLog(@"JavaCom 5= %@" , JavaCom);
        [self ColorsListing];
        
        
        
        
    }
    else if (Hod == 3)
    {
        
        //////NSLog(@"********** HodChetvergoTreugolnika 3");
        color3triangle = color4triangle ;
        JavaCom = [NSString stringWithFormat:@"document.getElementById('triangle3').style.borderBottom='140px solid %@';",  [self ourColors:color3triangle]];
        [webView stringByEvaluatingJavaScriptFromString:JavaCom];
        //////NSLog(@"JavaCom = %@", JavaCom);
        
        
        [self ColorsListing];
        
        // 1 triangle not visible
        JavaCom = @"document.getElementById('triangle4').visibility='hidden';";
        [webView stringByEvaluatingJavaScriptFromString:JavaCom];
        //////NSLog(@"JavaCom 2= %@" , JavaCom);
        
        
        [self ColorsListing];
        
        JavaCom = @" document.getElementsByClassName('triangle4')[0].classList.remove('flipCard12');";
        
        [webView stringByEvaluatingJavaScriptFromString:JavaCom];
        //////NSLog(@"JavaCom 2a= %@" , JavaCom);
        
        
        [self ColorsListing];
        
        
        color4triangle = color4nextTriangle;
        JavaCom = [NSString stringWithFormat:@"document.getElementById('triangle4').style.borderLeft='140px solid %@';",  [self ourColors:color4triangle]];
        [webView stringByEvaluatingJavaScriptFromString:JavaCom];
        //////NSLog(@"JavaCom 3 = %@", JavaCom);
        
        
        [self ColorsListing];
        
        
        
        color4nextTriangle = [self randomColor];
        JavaCom = [NSString stringWithFormat:@"document.getElementById('triangle4next').style.borderLeft='140px solid %@';",  [self ourColors:color4nextTriangle]];
        [webView stringByEvaluatingJavaScriptFromString:JavaCom];
        //////NSLog(@"JavaCom 6 = %@", JavaCom);
        
        
        [self ColorsListing];
        
        JavaCom = @"document.getElementById('triangle4').visibility='visible';";
        [webView stringByEvaluatingJavaScriptFromString:JavaCom];
        //////NSLog(@"JavaCom 5= %@" , JavaCom);
        [self ColorsListing];
        
        
        

    }
    TransitonFinish = YES;
    
}

/****** END HodChetvergoTreugolnika ********/


/******   HodPTretegoTreugolnika    ********/

- (void)HodPTretegoTreugolnika {
    //////NSLog(@"********** HodPTretegoTreugolnika");
    
    NSString *JavaCom = @"document.getElementById('triangle3').style['-webkit-transition-duration'] = '0';";
    [webView stringByEvaluatingJavaScriptFromString:JavaCom];
    //////NSLog(@"JavaCom 2= %@" , JavaCom);
    
    
    [self ColorsListing];

   
    if (Hod == 1)
    {
        
        //////NSLog(@"********** HodPTretegoTreugolnika 1" );
        
        color4triangle = color3triangle ;
        JavaCom = [NSString stringWithFormat:@"document.getElementById('triangle4').style.borderLeft='140px solid %@';",  [self ourColors:color4triangle]];
        [webView stringByEvaluatingJavaScriptFromString:JavaCom];
        //////NSLog(@"JavaCom = %@", JavaCom);
        
        
        [self ColorsListing];

        // 1 triangle not visible
        JavaCom = @"document.getElementById('triangle3').visibility='hidden';";
        [webView stringByEvaluatingJavaScriptFromString:JavaCom];
        //////NSLog(@"JavaCom 2= %@" , JavaCom);
        
        
        [self ColorsListing];

        JavaCom = @" document.getElementsByClassName('triangle3')[0].classList.remove('flipCard7');";
        
        [webView stringByEvaluatingJavaScriptFromString:JavaCom];
        //////NSLog(@"JavaCom 2a= %@" , JavaCom);
        
        
        [self ColorsListing];

        
        color3triangle = color3nextTriangle;
        JavaCom = [NSString stringWithFormat:@"document.getElementById('triangle3').style.borderBottom='140px solid %@';",  [self ourColors:color3triangle]];
        [webView stringByEvaluatingJavaScriptFromString:JavaCom];
        //////NSLog(@"JavaCom 3 = %@", JavaCom);
        
        
        [self ColorsListing];

        
        
        color3nextTriangle = [self randomColor];
        JavaCom = [NSString stringWithFormat:@"document.getElementById('triangle3next').style.borderBottom='140px solid %@';",  [self ourColors:color3nextTriangle]];
        [webView stringByEvaluatingJavaScriptFromString:JavaCom];
        //////NSLog(@"JavaCom 6 = %@", JavaCom);
        
        
        [self ColorsListing];
        
        JavaCom = @"document.getElementById('triangle3').visibility='visible';";
        [webView stringByEvaluatingJavaScriptFromString:JavaCom];
        //////NSLog(@"JavaCom 5= %@" , JavaCom);
        [self ColorsListing];
        
        
        
    }
    else if (Hod == 2)
    {
        //////NSLog(@"********** HodPTretegoTreugolnika 2");
        color1triangle = color3triangle ;
        JavaCom = [NSString stringWithFormat:@"document.getElementById('triangle1').style.borderTop='140px solid %@';",  [self ourColors:color1triangle]];
        [webView stringByEvaluatingJavaScriptFromString:JavaCom];
        //////NSLog(@"JavaCom = %@", JavaCom);
        // 1 triangle not visible
        JavaCom = @"document.getElementById('triangle3').visibility='hidden';";
        [webView stringByEvaluatingJavaScriptFromString:JavaCom];
        //////NSLog(@"JavaCom 2= %@" , JavaCom);
        JavaCom = @" document.getElementsByClassName('triangle3')[0].classList.remove('flipCard8');";
        
        [webView stringByEvaluatingJavaScriptFromString:JavaCom];
        //////NSLog(@"JavaCom 2a= %@" , JavaCom);
        color3triangle = color3nextTriangle;
        JavaCom = [NSString stringWithFormat:@"document.getElementById('triangle3').style.borderBottom='140px solid %@';",  [self ourColors:color3triangle]];
        [webView stringByEvaluatingJavaScriptFromString:JavaCom];
        //////NSLog(@"JavaCom 3 = %@", JavaCom);
        color3nextTriangle = [self randomColor];
        JavaCom = [NSString stringWithFormat:@"document.getElementById('triangle3next').style.borderBottom='140px solid %@';",  [self ourColors:color3nextTriangle]];
        [webView stringByEvaluatingJavaScriptFromString:JavaCom];
        //////NSLog(@"JavaCom 6 = %@", JavaCom);
        JavaCom = @"document.getElementById('triangle3').visibility='visible';";
        [webView stringByEvaluatingJavaScriptFromString:JavaCom];
        //////NSLog(@"JavaCom 5= %@" , JavaCom);
        

    }
    else if (Hod == 3)
    {
        
        //////NSLog(@"********** HodPTretegoTreugolnika 3");
        color2triangle = color3triangle ;
        JavaCom = [NSString stringWithFormat:@"document.getElementById('triangle2').style.borderRight='140px solid %@';",  [self ourColors:color2triangle]];
        [webView stringByEvaluatingJavaScriptFromString:JavaCom];
        //////NSLog(@"JavaCom = %@", JavaCom);
        // 1 triangle not visible
        JavaCom = @"document.getElementById('triangle3').visibility='hidden';";
        [webView stringByEvaluatingJavaScriptFromString:JavaCom];
        //////NSLog(@"JavaCom 2= %@" , JavaCom);
        JavaCom = @" document.getElementsByClassName('triangle3')[0].classList.remove('flipCard9');";
        
        [webView stringByEvaluatingJavaScriptFromString:JavaCom];
        //////NSLog(@"JavaCom 2a= %@" , JavaCom);
        color3triangle = color3nextTriangle;
        JavaCom = [NSString stringWithFormat:@"document.getElementById('triangle3').style.borderBottom='140px solid %@';",  [self ourColors:color3triangle]];
        [webView stringByEvaluatingJavaScriptFromString:JavaCom];
        //////NSLog(@"JavaCom 3 = %@", JavaCom);
        color3nextTriangle = [self randomColor];
        JavaCom = [NSString stringWithFormat:@"document.getElementById('triangle3next').style.borderBottom='140px solid %@';",  [self ourColors:color3nextTriangle]];
        [webView stringByEvaluatingJavaScriptFromString:JavaCom];
        //////NSLog(@"JavaCom 6 = %@", JavaCom);
        JavaCom = @"document.getElementById('triangle3').visibility='visible';";
        [webView stringByEvaluatingJavaScriptFromString:JavaCom];
        //////NSLog(@"JavaCom 5= %@" , JavaCom);
    }
    TransitonFinish = YES;

}
/****** END HodPTretegoTreugolnika ********/


/****** HodVtorogoTreugolnika ********/

- (void)HodVtorogoTreugolnika {
    //////NSLog(@"********** HodVtorogoTreugolnika");
    NSString *JavaCom = @"document.getElementById('triangle2').style['-webkit-transition-duration'] = '0';";
    [webView stringByEvaluatingJavaScriptFromString:JavaCom];
    //////NSLog(@"JavaCom 2= %@" , JavaCom);
    
    
    
    
    if (Hod == 1)
    {
        color3triangle = color2triangle ;
        JavaCom = [NSString stringWithFormat:@"document.getElementById('triangle3').style.borderBottom='140px solid %@';",  [self ourColors:color3triangle]];
        [webView stringByEvaluatingJavaScriptFromString:JavaCom];
       
        JavaCom = @"document.getElementById('triangle2').visibility='hidden';";
        [webView stringByEvaluatingJavaScriptFromString:JavaCom];
        //////NSLog(@"JavaCom 2= %@" , JavaCom);
        
        
      JavaCom = @" document.getElementsByClassName('triangle2')[0].classList.remove('flipCard4');";
        [webView stringByEvaluatingJavaScriptFromString:JavaCom];
        //////NSLog(@"JavaCom 2a= %@" , JavaCom);
        
        
        color2triangle = color2nextTriangle;
        JavaCom = [NSString stringWithFormat:@"document.getElementById('triangle2').style.borderRight='140px solid %@';",  [self ourColors:color2triangle]];
        [webView stringByEvaluatingJavaScriptFromString:JavaCom];
        //////NSLog(@"JavaCom 3 = %@", JavaCom);
                
        color2nextTriangle = [self randomColor];
        JavaCom = [NSString stringWithFormat:@"document.getElementById('triangle2next').style.borderRight='140px solid %@';",  [self ourColors:color2nextTriangle]];
        [webView stringByEvaluatingJavaScriptFromString:JavaCom];
        //////NSLog(@"JavaCom 6 = %@", JavaCom);
        
       
        JavaCom = @"document.getElementById('triangle2').visibility='visible';";
        [webView stringByEvaluatingJavaScriptFromString:JavaCom];
        //////NSLog(@"JavaCom 5= %@" , JavaCom);
        
        
        
    }
    else if (Hod == 2)
    {
        //////NSLog (@"******CurrenTriangle 2 case 2");
        color4triangle = color2triangle ;
        NSString *JavaCom = [NSString stringWithFormat:@"document.getElementById('triangle4').style.borderLeft='140px solid %@';",  [self ourColors:color4triangle]];
        [webView stringByEvaluatingJavaScriptFromString:JavaCom];
        //////NSLog(@"JavaCom = %@", JavaCom);
        JavaCom = @"document.getElementById('triangle2').visibility='hidden';";
        [webView stringByEvaluatingJavaScriptFromString:JavaCom];
        //////NSLog(@"JavaCom 2= %@" , JavaCom);
        color2triangle = color2nextTriangle;
        JavaCom = [NSString stringWithFormat:@"document.getElementById('triangle2').style.borderRight='140px solid %@';",  [self ourColors:color2triangle]];
        [webView stringByEvaluatingJavaScriptFromString:JavaCom];
        //////NSLog(@"JavaCom 3 = %@", JavaCom);
        
        JavaCom = @" document.getElementsByClassName('triangle2')[0].classList.remove('flipCard5');";
        [webView stringByEvaluatingJavaScriptFromString:JavaCom];
        //////NSLog(@"JavaCom 2a= %@" , JavaCom);
        JavaCom = @"document.getElementById('triangle2').visibility='visible';";
        
        [webView stringByEvaluatingJavaScriptFromString:JavaCom];
        //////NSLog(@"JavaCom 5= %@" , JavaCom);
        color2nextTriangle = [self randomColor];
        JavaCom = [NSString stringWithFormat:@"document.getElementById('triangle1next').style.borderRight='140px solid %@';",  [self ourColors:color2nextTriangle]];
        [webView stringByEvaluatingJavaScriptFromString:JavaCom];
        //////NSLog(@"JavaCom 6 = %@", JavaCom);
    }
    else if (Hod == 3)
    {
        color1triangle = color2triangle ;
        NSString *JavaCom = [NSString stringWithFormat:@"document.getElementById('triangle1').style.borderTop='140px solid %@';",  [self ourColors:color1triangle]];
        [webView stringByEvaluatingJavaScriptFromString:JavaCom];
        //////NSLog(@"JavaCom = %@", JavaCom);
        JavaCom = @"document.getElementById('triangle2').visibility='hidden';";
        [webView stringByEvaluatingJavaScriptFromString:JavaCom];
        //////NSLog(@"JavaCom 2= %@" , JavaCom);
        color2triangle = color2nextTriangle;
        JavaCom = [NSString stringWithFormat:@"document.getElementById('triangle2').style.borderRight='140px solid %@';",  [self ourColors:color2triangle]];
        [webView stringByEvaluatingJavaScriptFromString:JavaCom];
        //////NSLog(@"JavaCom 3 = %@", JavaCom);
       JavaCom = @" document.getElementsByClassName('triangle2')[0].classList.remove('flipCard6');";
        [webView stringByEvaluatingJavaScriptFromString:JavaCom];
        //////NSLog(@"JavaCom 2a= %@" , JavaCom);
        JavaCom = @"document.getElementById('triangle2').visibility='visible';";
        
        [webView stringByEvaluatingJavaScriptFromString:JavaCom];
        //////NSLog(@"JavaCom 5= %@" , JavaCom);
        color2nextTriangle = [self randomColor];
        JavaCom = [NSString stringWithFormat:@"document.getElementById('triangle2next').style.borderRight='140px solid %@';",  [self ourColors:color2nextTriangle]];
        [webView stringByEvaluatingJavaScriptFromString:JavaCom];
        //////NSLog(@"JavaCom 6 = %@", JavaCom);
    }
    TransitonFinish = YES;

}
/****** END HodVtorogoTreugolnika ********/




/****** HodPervogoTreugolnika ********/

- (void)HodPervogoTreugolnika {
    ////////NSLog(@"********** HodPervogoTreugolnika");
    
    NSString *JavaCom = @"document.getElementById('triangle1').style['-webkit-transition-duration'] = '0';";
    [webView stringByEvaluatingJavaScriptFromString:JavaCom];
    ////////NSLog(@"JavaCom 2= %@" , JavaCom);
    
    

    
    if (Hod == 1)
    {
        color2triangle = color1triangle ;
        JavaCom = [NSString stringWithFormat:@"document.getElementById('triangle2').style.borderRight='140px solid %@';",  [self ourColors:color2triangle]];
        [webView stringByEvaluatingJavaScriptFromString:JavaCom];
      //  //////NSLog(@"JavaCom = %@", JavaCom);
        
        
        // 1 triangle not visible
        JavaCom = @"document.getElementById('triangle1').visibility='hidden';";
        [webView stringByEvaluatingJavaScriptFromString:JavaCom];
        ////////NSLog(@"JavaCom 2= %@" , JavaCom);
        
                JavaCom = @" document.getElementsByClassName('triangle1')[0].classList.remove('flipCard1');";
        
        [webView stringByEvaluatingJavaScriptFromString:JavaCom];
        ////////NSLog(@"JavaCom 2a= %@" , JavaCom);
        
        
        color1triangle = color1nextTriangle;
        JavaCom = [NSString stringWithFormat:@"document.getElementById('triangle1').style.borderTop='140px solid %@';",  [self ourColors:color1triangle]];
        [webView stringByEvaluatingJavaScriptFromString:JavaCom];
        ////////NSLog(@"JavaCom 3 = %@", JavaCom);
        
   
       
      
        color1nextTriangle = [self randomColor];
         JavaCom = [NSString stringWithFormat:@"document.getElementById('triangle1next').style.borderTop='140px solid %@';",  [self ourColors:color1nextTriangle]];
        [webView stringByEvaluatingJavaScriptFromString:JavaCom];
        //////NSLog(@"JavaCom 6 = %@", JavaCom);
        
        
       
        
        JavaCom = @"document.getElementById('triangle1').visibility='visible';";
        [webView stringByEvaluatingJavaScriptFromString:JavaCom];
        ////////NSLog(@"JavaCom 5= %@" , JavaCom);
        
        
        
    }
    else if (Hod == 2)
    {
        //////NSLog (@"******CurrenTriangle 1 case 2");
        color3triangle = color1triangle ;
        NSString *JavaCom = [NSString stringWithFormat:@"document.getElementById('triangle3').style.borderBottom='140px solid %@';",  [self ourColors:color3triangle]];
        [webView stringByEvaluatingJavaScriptFromString:JavaCom];
       // //////NSLog(@"JavaCom = %@", JavaCom);
        JavaCom = @"document.getElementById('triangle1').visibility='hidden';";
        [webView stringByEvaluatingJavaScriptFromString:JavaCom];
        //////NSLog(@"JavaCom 2= %@" , JavaCom);
        color1triangle = color1nextTriangle;
        JavaCom = [NSString stringWithFormat:@"document.getElementById('triangle1').style.borderTop='140px solid %@';",  [self ourColors:color1triangle]];
        [webView stringByEvaluatingJavaScriptFromString:JavaCom];
        //////NSLog(@"JavaCom 3 = %@", JavaCom);
        JavaCom = @"document.getElementById('triangle1').style.top='60px';"
        @"document.getElementById('triangle1').style.left='20px';"
        @"document.getElementById('triangle1').style.borderLeft='140px solid transparent;'"
        @"document.getElementById('triangle1').style.borderRight='140px solid transparent;'";
        [webView stringByEvaluatingJavaScriptFromString:JavaCom];
        //////NSLog(@"JavaCom 4 = %@", JavaCom);
        JavaCom = @" document.getElementsByClassName('triangle1')[0].classList.remove('flipCard2');";
        [webView stringByEvaluatingJavaScriptFromString:JavaCom];
        //////NSLog(@"JavaCom 2a= %@" , JavaCom);
        JavaCom = @"document.getElementById('triangle1').visibility='visible';";
        
        [webView stringByEvaluatingJavaScriptFromString:JavaCom];
        //////NSLog(@"JavaCom 5= %@" , JavaCom);
        color1nextTriangle = [self randomColor];
        JavaCom = [NSString stringWithFormat:@"document.getElementById('triangle1next').style.borderTop='140px solid %@';",  [self ourColors:color1nextTriangle]];
        [webView stringByEvaluatingJavaScriptFromString:JavaCom];
        //////NSLog(@"JavaCom 6 = %@", JavaCom);
    }
    else if (Hod == 3)
    {
        color4triangle = color1triangle ;
        NSString *JavaCom = [NSString stringWithFormat:@"document.getElementById('triangle4').style.borderLeft='140px solid %@';",  [self ourColors:color4triangle]];
        [webView stringByEvaluatingJavaScriptFromString:JavaCom];
        //////NSLog(@"JavaCom = %@", JavaCom);
        JavaCom = @"document.getElementById('triangle1').visibility='hidden';";
        [webView stringByEvaluatingJavaScriptFromString:JavaCom];
        //////NSLog(@"JavaCom 2= %@" , JavaCom);
        color1triangle = color1nextTriangle;
        JavaCom = [NSString stringWithFormat:@"document.getElementById('triangle1').style.borderTop='140px solid %@';",  [self ourColors:color1triangle]];
        [webView stringByEvaluatingJavaScriptFromString:JavaCom];
        //////NSLog(@"JavaCom 3 = %@", JavaCom);
        JavaCom = @"document.getElementById('triangle1').style.top='60px';"
        @"document.getElementById('triangle1').style.left='20px';"
        @"document.getElementById('triangle1').style.borderLeft='140px solid transparent;'"
        @"document.getElementById('triangle1').style.borderRight='140px solid transparent;'";
        [webView stringByEvaluatingJavaScriptFromString:JavaCom];
        //////NSLog(@"JavaCom 4 = %@", JavaCom);
        JavaCom = @" document.getElementsByClassName('triangle1')[0].classList.remove('flipCard3');";
        [webView stringByEvaluatingJavaScriptFromString:JavaCom];
        //////NSLog(@"JavaCom 2a= %@" , JavaCom);
        JavaCom = @"document.getElementById('triangle1').visibility='visible';";
        
        [webView stringByEvaluatingJavaScriptFromString:JavaCom];
        //////NSLog(@"JavaCom 5= %@" , JavaCom);
        color1nextTriangle = [self randomColor];
        JavaCom = [NSString stringWithFormat:@"document.getElementById('triangle1next').style.borderTop='140px solid %@';",  [self ourColors:color1nextTriangle]];
        [webView stringByEvaluatingJavaScriptFromString:JavaCom];
        //////NSLog(@"JavaCom 6 = %@", JavaCom);
    }
    TransitonFinish = YES;
}

/****** END HodPervogoTreugolnika ********/
- (void)ChengeTriangleColors {
           if (currentTriangle == 1)
        {
            [self HodPervogoTreugolnika];
        }
        else if (currentTriangle == 2)
        {
            ////NSLog(@"%@",@" HodVtorogoTreugolnika **********");
            
            [self HodVtorogoTreugolnika];

        }
        else if (currentTriangle == 3)
        {
           
            [self HodPTretegoTreugolnika];
            
        }
        else if (currentTriangle == 4)
        {
            [self HodChetvergoTreugolnika];
         }
    
    [self CheckLevelFinish];
}
/*********** END ChengeTriangleColors ***************/

- (void)nextHod {
    //////NSLog (@"currentTriangle = %i", currentTriangle );
     //////NSLog (@"previousTriangle = %i", previousTriangle );
 
    //if ( currentTriangle == previousTriangle ) {
    
    Hod = Hod + 1;
    if ((Hod>3)||(Hod<1)) Hod = 1;
    //////NSLog(@"nextHod = %i", Hod);
   // } else Hod = 1;
    //////NSLog (@"Hod = %i", Hod );
    
    CurrentScore=CurrentScore-1;
    currentScoreLabel.text =  [NSString stringWithFormat:@"%d", CurrentScore];
    if (CurrentScore == 100)  {
        currentScoreLabel.text =  [NSString stringWithFormat:@"%@", NSLocalizedString(@"Collect one color", nil) ];
    }
    [[NSUserDefaults standardUserDefaults] setInteger:CurrentScore forKey:@"CurrentScore"];
    [[NSUserDefaults standardUserDefaults] synchronize];

    
}    
/***********END nextHod ***************/

- (void)checkFirstTriangle:(float)px :(float)py
{
    //////NSLog(@"checkFirstTriangle");
    
    
if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
    
    float p1x=20;
    float p1y=60;
    float p2x=160;
    float p2y=200;
    float p3x=300;
    float p3y=60;
    
    float alpha = ((p2y - p3y)*(px - p3x) + (p3x - p2x)*(py - p3y)) /
    ((p2y - p3y)*(p1x - p3x) + (p3x - p2x)*(p1y - p3y));
    float beta = ((p3y - p1y)*(px - p3x) + (p1x - p3x)*(py - p3y)) /
    ((p2y - p3y)*(p1x - p3x) + (p3x - p2x)*(p1y - p3y));
    float gamma = 1.0f - alpha - beta;
    if ((alpha>0)&&(beta>0)&&(gamma>0))
    {
        //////NSLog(@"Внутри первого");
        currentTriangle = 1;
        [self nextHod];
        previousTriangle = 1;
        
        [webView stringByEvaluatingJavaScriptFromString:@"document.getElementById('triangle1').style['-webkit-transition-duration'] = '0.55s';"];
        [self playSystemSound3];
        
        switch (Hod)
        {
            case 1:
                [self.webView stringByEvaluatingJavaScriptFromString: @"flipCard1()"];
                break;
            case 2:
                [self.webView stringByEvaluatingJavaScriptFromString: @"flipCard2()"];
                break;
            case 3:
                [self.webView stringByEvaluatingJavaScriptFromString:@"flipCard3()"];
                break;
                
        }//switch (Hod)
        [self performSelector:@selector(ChengeTriangleColors) withObject:nil afterDelay:0.6];
        
        
    }
    else {
        //////NSLog(@"Вне первого");
        [self checkSecondTriangle:px :py];
    }
    
} else {
    // iPad 1
    //+ 20,60
    //0,0,140,140,280,0
    //
    //point p1(x1, y1); 20,60
    //point p2(x2, y2);160,200
    //point p3(x3, y3);300,60
    float p1x=40;
    float p1y=121;
    
    float p2x=598;
    float p2y=121;
    
    float p3x=320;
    float p3y=401;
    
    float alpha = ((p2y - p3y)*(px - p3x) + (p3x - p2x)*(py - p3y)) /
    ((p2y - p3y)*(p1x - p3x) + (p3x - p2x)*(p1y - p3y));
    float beta = ((p3y - p1y)*(px - p3x) + (p1x - p3x)*(py - p3y)) /
    ((p2y - p3y)*(p1x - p3x) + (p3x - p2x)*(p1y - p3y));
    float gamma = 1.0f - alpha - beta;
    if ((alpha>0)&&(beta>0)&&(gamma>0))
        {
        //////NSLog(@"Внутри первого");
            currentTriangle = 1;
             [self nextHod];
            previousTriangle = 1;
           
             [webView stringByEvaluatingJavaScriptFromString:@"document.getElementById('triangle1').style['-webkit-transition-duration'] = '0.55s';"];
             [self playSystemSound3];
            
            switch (Hod)
            {
                case 1:
                    [self.webView stringByEvaluatingJavaScriptFromString: @"flipCard1()"];
                    break;
                case 2:
                    [self.webView stringByEvaluatingJavaScriptFromString: @"flipCard2()"];
                    break;
                case 3:
                    [self.webView stringByEvaluatingJavaScriptFromString:@"flipCard3()"];
                    break;
                           
            }//switch (Hod)
            [self performSelector:@selector(ChengeTriangleColors) withObject:nil afterDelay:0.6];
             
            
      }
        else {
        //////NSLog(@"Вне первого");
        [self checkSecondTriangle:px :py];
        }
    } // iPad
    
}


- (void)checkSecondTriangle:(float)px :(float)py
{
    //  [self playSystemSoundBloked:nil];
    //////NSLog(@"checkSecondTriangle");
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        float p1x=160;
        float p1y=200;
        float p2x=300;
        float p2y=60;
        float p3x=300;
        float p3y=340;
        
        float alpha = ((p2y - p3y)*(px - p3x) + (p3x - p2x)*(py - p3y)) /
        ((p2y - p3y)*(p1x - p3x) + (p3x - p2x)*(p1y - p3y));
        float beta = ((p3y - p1y)*(px - p3x) + (p1x - p3x)*(py - p3y)) /
        ((p2y - p3y)*(p1x - p3x) + (p3x - p2x)*(p1y - p3y));
        float gamma = 1.0f - alpha - beta;
        if ((alpha>0)&&(beta>0)&&(gamma>0)) {
            //////NSLog(@"Внутри второго");
            
            
            if ((CurrentGrade==5)||(CurrentGrade==6)||(CurrentGrade==7)||(CurrentGrade==8)||(CurrentGrade==9)||(CurrentGrade==11)||(CurrentGrade==12)||(CurrentGrade==13)||(CurrentGrade==14)) {
                //////NSLog(@"%@",@" playSystemSoundBloked **CurrentGrade==5, 6, 7 ********");
                [self playSystemSoundBloked:nil];
                TransitonFinish = YES;
                return;
            }
            
            
            currentTriangle = 2;
            [self nextHod];
            previousTriangle = 2;
            [webView stringByEvaluatingJavaScriptFromString:@"document.getElementById('triangle2').style['-webkit-transition-duration'] = '0.55s';"];
            [self playSystemSound3];
            
            switch (Hod)
            {
                case 1:
                    [self.webView stringByEvaluatingJavaScriptFromString: @"flipCard4()"];
                    break;
                case 2:
                    [self.webView stringByEvaluatingJavaScriptFromString: @"flipCard5()"];
                    break;
                case 3:
                    [self.webView stringByEvaluatingJavaScriptFromString:@"flipCard6()"];
                    break;
                    
            }//switch (Hod)
            [self performSelector:@selector(ChengeTriangleColors) withObject:nil afterDelay:0.6];
            
        }//if
        else {
            //////NSLog(@"Вне второго");
            [self checkThirdTriangle:px :py];
        }
        
        
    } else { // iPad
        
    float p1x=601;
    float p1y=681;
    
    float p2x=598;
    float p2y=121;
    
    float p3x=320;
    float p3y=401;
    
    float alpha = ((p2y - p3y)*(px - p3x) + (p3x - p2x)*(py - p3y)) /
    ((p2y - p3y)*(p1x - p3x) + (p3x - p2x)*(p1y - p3y));
    float beta = ((p3y - p1y)*(px - p3x) + (p1x - p3x)*(py - p3y)) /
    ((p2y - p3y)*(p1x - p3x) + (p3x - p2x)*(p1y - p3y));
    float gamma = 1.0f - alpha - beta;
    if ((alpha>0)&&(beta>0)&&(gamma>0)) {
            //////NSLog(@"Внутри второго");
        
        
        if ((CurrentGrade==5)||(CurrentGrade==6)||(CurrentGrade==7)||(CurrentGrade==8)||(CurrentGrade==9)||(CurrentGrade==11)||(CurrentGrade==12)||(CurrentGrade==13)||(CurrentGrade==14)) {
            //////NSLog(@"%@",@" playSystemSoundBloked **CurrentGrade==5, 6, 7 ********");
            [self playSystemSoundBloked:nil];
            TransitonFinish = YES;
            return;
        }
        
        
        currentTriangle = 2;
        [self nextHod];
        previousTriangle = 2;
        [webView stringByEvaluatingJavaScriptFromString:@"document.getElementById('triangle2').style['-webkit-transition-duration'] = '0.55s';"];
        [self playSystemSound3];

    switch (Hod)
    {
        case 1:
            [self.webView stringByEvaluatingJavaScriptFromString: @"flipCard4()"];
            break;
        case 2:
            [self.webView stringByEvaluatingJavaScriptFromString: @"flipCard5()"];
            break;
        case 3:
            [self.webView stringByEvaluatingJavaScriptFromString:@"flipCard6()"];
            break;
            
    }//switch (Hod)
        [self performSelector:@selector(ChengeTriangleColors) withObject:nil afterDelay:0.6];
        
          }//if
    else {
        //////NSLog(@"Вне второго");
        [self checkThirdTriangle:px :py];
    }
      } // iPad
}
- (void)checkThirdTriangle:(float)px :(float)py
{
    //////NSLog(@"checkThirdTriangle");
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        float p1x=20;
        float p1y=340;
        float p2x=160;
        float p2y=200;
        float p3x=300;
        float p3y=340;
        
        float alpha = ((p2y - p3y)*(px - p3x) + (p3x - p2x)*(py - p3y)) /
        ((p2y - p3y)*(p1x - p3x) + (p3x - p2x)*(p1y - p3y));
        float beta = ((p3y - p1y)*(px - p3x) + (p1x - p3x)*(py - p3y)) /
        ((p2y - p3y)*(p1x - p3x) + (p3x - p2x)*(p1y - p3y));
        float gamma = 1.0f - alpha - beta;
        if ((alpha>0)&&(beta>0)&&(gamma>0)){
            
            //////NSLog(@"Внутри третьего по часовой");
            if ((CurrentGrade==13)||(CurrentGrade==14)) {
                //////NSLog(@"%@",@" playSystemSoundBloked **CurrentGrade==8 ********");
                [self playSystemSoundBloked:nil];
                TransitonFinish = YES;
                return;
            }
            currentTriangle = 3;
            [self nextHod];
            previousTriangle = 3;
            [webView stringByEvaluatingJavaScriptFromString:@"document.getElementById('triangle3').style['-webkit-transition-duration'] = '0.55s';"];
            [self playSystemSound3];
            
            switch (Hod)
            {
                case 1:
                    [self.webView stringByEvaluatingJavaScriptFromString: @"flipCard7()"];
                    break;
                case 2:
                    [self.webView stringByEvaluatingJavaScriptFromString: @"flipCard8()"];
                    break;
                case 3:
                    [self.webView stringByEvaluatingJavaScriptFromString:@"flipCard9()"];
                    break;
                    
                    
            }//switch (Hod)
            [self performSelector:@selector(ChengeTriangleColors) withObject:nil afterDelay:0.6];
            
            [self ColorsListing];
            
        }
        
        
        else {
            //////NSLog(@"Вне третьего");
            [self checkFourthTriangle:px :py];
        }
        
    } else { // iPad

    float p1x=320;
    float p1y=402;
    
    float p2x=600;
    float p2y=680;
    
    float p3x=40;
    float p3y=680;
    
    float alpha = ((p2y - p3y)*(px - p3x) + (p3x - p2x)*(py - p3y)) /
    ((p2y - p3y)*(p1x - p3x) + (p3x - p2x)*(p1y - p3y));
    float beta = ((p3y - p1y)*(px - p3x) + (p1x - p3x)*(py - p3y)) /
    ((p2y - p3y)*(p1x - p3x) + (p3x - p2x)*(p1y - p3y));
    float gamma = 1.0f - alpha - beta;
    if ((alpha>0)&&(beta>0)&&(gamma>0)){
        
        //////NSLog(@"Внутри третьего по часовой");
        if ((CurrentGrade==13)||(CurrentGrade==14)) {
            //////NSLog(@"%@",@" playSystemSoundBloked **CurrentGrade==8 ********");
            [self playSystemSoundBloked:nil];
            TransitonFinish = YES;
            return;
        }
        currentTriangle = 3;
        [self nextHod];
        previousTriangle = 3;
        [webView stringByEvaluatingJavaScriptFromString:@"document.getElementById('triangle3').style['-webkit-transition-duration'] = '0.55s';"];
        [self playSystemSound3];

        switch (Hod)
        {
            case 1:
                [self.webView stringByEvaluatingJavaScriptFromString: @"flipCard7()"];
                break;
            case 2:
                [self.webView stringByEvaluatingJavaScriptFromString: @"flipCard8()"];
                break;
            case 3:
                [self.webView stringByEvaluatingJavaScriptFromString:@"flipCard9()"];
                break;
            
                
        }//switch (Hod)
        [self performSelector:@selector(ChengeTriangleColors) withObject:nil afterDelay:0.6];
        
        [self ColorsListing];

    }
    
    
    else {
        //////NSLog(@"Вне третьего");
        [self checkFourthTriangle:px :py];
    }
      }//iPpad
}


- (void)checkFourthTriangle:(float)px :(float)py

{
    //////NSLog(@"checkFourthTriangle");
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        
        float p1x=20;
        float p1y=60;
        float p2x=160;
        float p2y=200;
        float p3x=20;
        float p3y=340;
        
        float alpha = ((p2y - p3y)*(px - p3x) + (p3x - p2x)*(py - p3y)) /
        ((p2y - p3y)*(p1x - p3x) + (p3x - p2x)*(p1y - p3y));
        float beta = ((p3y - p1y)*(px - p3x) + (p1x - p3x)*(py - p3y)) /
        ((p2y - p3y)*(p1x - p3x) + (p3x - p2x)*(p1y - p3y));
        float gamma = 1.0f - alpha - beta;
        if ((alpha>0)&&(beta>0)&&(gamma>0))
        {
            //////NSLog(@"Внутри четвертого");
            if ((CurrentGrade==8)||(CurrentGrade==9)||(CurrentGrade==12)||(CurrentGrade==13)||(CurrentGrade==14)) {
                //////NSLog(@"%@",@" playSystemSoundBloked **CurrentGrade==8 ********");
                [self playSystemSoundBloked:nil];
                TransitonFinish = YES;
                return;
            }
            [self playSystemSound3];
            currentTriangle = 4;
            [self nextHod];
            previousTriangle = 4;
            [webView stringByEvaluatingJavaScriptFromString:@"document.getElementById('triangle4').style['-webkit-transition-duration'] = '0.55s';"];
            
            switch (Hod)
            {
                case 1:
                    [self.webView stringByEvaluatingJavaScriptFromString: @"flipCard10()"];
                    break;
                case 2:
                    [self.webView stringByEvaluatingJavaScriptFromString: @"flipCard11()"];
                    break;
                case 3:
                    [self.webView stringByEvaluatingJavaScriptFromString:@"flipCard12()"];
                    break;
                    
            }//switch (Hod)
            [self performSelector:@selector(ChengeTriangleColors) withObject:nil afterDelay:0.6];
            
        }
        else {
            TransitonFinish = YES;
            //////NSLog(@"Вне четвертого");
        }

        
    } else { // iPad
    
    float p1x=40;
    float p1y=121;
    
    float p2x=40;
    float p2y=681;
    
    float p3x=320;
    float p3y=401;
    
    float alpha = ((p2y - p3y)*(px - p3x) + (p3x - p2x)*(py - p3y)) /
    ((p2y - p3y)*(p1x - p3x) + (p3x - p2x)*(p1y - p3y));
    float beta = ((p3y - p1y)*(px - p3x) + (p1x - p3x)*(py - p3y)) /
    ((p2y - p3y)*(p1x - p3x) + (p3x - p2x)*(p1y - p3y));
    float gamma = 1.0f - alpha - beta;
    if ((alpha>0)&&(beta>0)&&(gamma>0))
    {
        //////NSLog(@"Внутри четвертого");
        if ((CurrentGrade==8)||(CurrentGrade==9)||(CurrentGrade==12)||(CurrentGrade==13)||(CurrentGrade==14)) {
            //////NSLog(@"%@",@" playSystemSoundBloked **CurrentGrade==8 ********");
            [self playSystemSoundBloked:nil];
            TransitonFinish = YES;
            return;
        }
[self playSystemSound3];
        currentTriangle = 4;
        [self nextHod];
        previousTriangle = 4;
        [webView stringByEvaluatingJavaScriptFromString:@"document.getElementById('triangle4').style['-webkit-transition-duration'] = '0.55s';"];
        
        switch (Hod)
        {
            case 1:
                [self.webView stringByEvaluatingJavaScriptFromString: @"flipCard10()"];
                break;
            case 2:
                [self.webView stringByEvaluatingJavaScriptFromString: @"flipCard11()"];
                break;
            case 3:
                [self.webView stringByEvaluatingJavaScriptFromString:@"flipCard12()"];
                break;
                
        }//switch (Hod)
        [self performSelector:@selector(ChengeTriangleColors) withObject:nil afterDelay:0.6];
        
    }
    else {
            TransitonFinish = YES;
        //////NSLog(@"Вне четвертого");
    }
        }//iPad
}

//- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    //////NSLog(@"touchesEnded");
  //////NSLog(@" TransitonFinish= %@", TransitonFinish ? @"Yes" : @"No");
   if ( TransitonFinish ){

    //////NSLog(@"touchesEnded TransitonFinish");
       
       if (touchViewOnOf) {
           UITouch *aTouch = [touches anyObject];
           
           
           CGPoint point = [aTouch locationInView:touchView];
           // point.x and point.y have the coordinates of the touch
              //////NSLog(@"%lf %lf", point.x, point.y);
           TransitonFinish = NO;
           
           [self checkFirstTriangle:point.x :point.y];

       } 
   }
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    //////NSLog(@"touchesBegan");
   // if ((databaseNumber==4)||(databaseNumber==5)) return;
    
    NSString *evolutionSwichOnOffKey =  [[NSUserDefaults standardUserDefaults] stringForKey:@"evolutionSwichOnOffKey"];
	// //////NSLog(@"soundOnOffKey=%@", soundOnOffKey);
	if (![evolutionSwichOnOffKey isEqualToString: @"NO"]) {
        
        
        UITouch *touch = [touches anyObject];
        
        if([touch view] == touchView){
            
            
            
            // //////NSLog(@"Touch");
            //  [self stopTimer];
            //[self timerTick:nil];
            // [self startTimer];
            
        } //else {
        // //////NSLog(@"No touch");
        //}
    }
}


- (void)viewDidDisappear:(BOOL)animated
{
    //////NSLog(@"%@", @"++++++++++++++++++viewDidDisappear");
    touchViewOnOf = FALSE;
    
    touchView.userInteractionEnabled = NO;
    
    OldCurrentLevel = CurrentLevel;
    OldCurrentGrade = CurrentGrade;
   // [self saveLastphrase:nil];
    //Let iPhone  sleeping
    [UIApplication sharedApplication].idleTimerDisabled = NO;
    //[self stopTimer];
    [super viewDidDisappear:animated];
}


- (void)viewWillAppear:(BOOL)animated{
    
    //////NSLog(@"%@", @"*** viewWillAppear");
   
    //////NSLog(@"%i", Hod);
    
      touchViewOnOf = TRUE;
    
    touchView.userInteractionEnabled = YES;
    
    if(![[NSUserDefaults standardUserDefaults] boolForKey:@"sound2Switch"]) {
        PlayFlipSound = NO;
    } else {
        PlayFlipSound = YES;
    }
    CurrentLevel =  (int) [[NSUserDefaults standardUserDefaults] integerForKey:@"CurrentLevel"];
    //////NSLog(@"CurrentLevel = %i", CurrentLevel);
    if ((CurrentLevel <= 0)||(CurrentLevel >24)) {
        CurrentLevel = 1;
          [[NSUserDefaults standardUserDefaults] setInteger:CurrentLevel forKey:@"CurrentLevel"];
    }
    CurrentGrade =  (int) [[NSUserDefaults standardUserDefaults] integerForKey:@"CurrentGrade"];
    //////NSLog(@"CurrentGrade = %i", CurrentGrade);
    if ((CurrentGrade <= 1)||(CurrentGrade >14)) {
        CurrentGrade = 1;
         [[NSUserDefaults standardUserDefaults] setInteger:CurrentGrade forKey:@"CurrentGrade"];
    }
    
    CurrentScore = (int) [[NSUserDefaults standardUserDefaults] integerForKey:@"CurrentScore"];
    if (CurrentScore<1) CurrentScore=0;
    
    //////NSLog(@"CurrentScore = %i", CurrentScore);
    currentScoreLabel.text =  [NSString stringWithFormat:@"%d", CurrentScore];

    if (CurrentScore == 100)  {
        currentScoreLabel.text =  [NSString stringWithFormat:@"%@", NSLocalizedString(@"Collect one color", nil) ];
    }
    //////NSLog(@"Main viewWillAppear chengedLevelOrGrade= %@", [[NSUserDefaults standardUserDefaults] boolForKey:@"chengedLevelOrGrade"] ? @"Yes" : @"No");
    
    if([[NSUserDefaults standardUserDefaults] boolForKey:@"chengedLevelOrGrade"]) {
            [self newLevelStart];
        
        [[NSUserDefaults standardUserDefaults] setBool:FALSE forKey:@"chengedLevelOrGrade"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    
    [self setLevelLetter];
}



- (void)viewDidAppear:(BOOL)animated
{
   //////NSLog(@"%@", @"*** viewDidAppear");
    
    [super viewDidAppear:animated];
    ////////NSLog(@"%@", @"*** END viewDidAppear**");
    
}


 - (BOOL)shouldAutorotate {
 //////NSLog(@"%@", @"shouldAutorotate");
 return NO;
 }



- (void)RestoreValuesOfStart
{
     //////NSLog(@"START RestoreValuesOfStar " );
    CurrentLevel =   (int)[[NSUserDefaults standardUserDefaults] integerForKey:@"CurrentLevel"];
    //////NSLog(@"CurrentLevel = %i", CurrentLevel);
    if ((CurrentLevel <= 0)||(CurrentLevel >24)) {
        CurrentLevel = 1;
    }
    CurrentGrade =  (int) [[NSUserDefaults standardUserDefaults] integerForKey:@"CurrentGrade"];
    //////NSLog(@"CurrentGrade = %i", CurrentGrade);
    if ((CurrentGrade <= 1)||(CurrentGrade >14)) {
        CurrentGrade = 1;
    }
    
    [self showHideLocks];
   
    CurrentScore =  (int)[[NSUserDefaults standardUserDefaults] integerForKey:@"CurrentScore"];
    if (CurrentScore<1) CurrentScore=0;
    //////NSLog(@"CurrentScore = %i", CurrentScore);
    currentScoreLabel.text =  [NSString stringWithFormat:@"%d", CurrentScore];
    if (CurrentScore == 100)  {
        currentScoreLabel.text =  [NSString stringWithFormat:@"%@", NSLocalizedString(@"Collect one color", nil) ];
    }
  if (CurrentLevel == 1)   [self  newLevelStart];
    
    if  (color1triangle==0)    [self  setNewLevelColors];
   // [self setLevelLetter];
    TransitonFinish = YES;
    Hod = 0;
    
    
    //////NSLog(@"FINISH RestoreValuesOfStart Hod= %i", Hod);
}

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    
    if ([GameCenterManager isGameCenterAvailable]) {
        
        self.gameCenterManager = [[[GameCenterManager alloc] init] autorelease];
        [self.gameCenterManager setDelegate:self];
        [self.gameCenterManager authenticateLocalUser];
        ////////NSLog(@"viewDidLoad gameCenterManager authenticateLocalUser ");
        
    } else {
        
        // The current device does not support Game Center.
        ////////NSLog(@"The current device does not support Game Center.");
        
    }
    

    
    
    
    [self SystemSoundServices];
    
  
    CurrentScore =  (int)[[NSUserDefaults standardUserDefaults] integerForKey:@"CurrentScore"];
    if (CurrentScore<1) CurrentScore=100;

   
        
    [[NSUserDefaults standardUserDefaults] setInteger:CurrentScore forKey:@"CurrentScore"];

    if (CurrentScore == 100)  {
        currentScoreLabel.text =  [NSString stringWithFormat:@"%@", NSLocalizedString(@"Collect one color", nil) ];
    }




    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        currentPage =  [[[NSBundle mainBundle] pathForResource:@"game-iphoneV" ofType:@"html"] mutableCopy];
        
    } else {
        currentPage =  [[[NSBundle mainBundle] pathForResource:@"game-ipad" ofType:@"html"] mutableCopy];
        
    }
    
    NSData *htmlData = [NSData dataWithContentsOfFile:currentPage];
    path = [[NSBundle mainBundle] bundlePath];
    NSURL *baseURL = [NSURL fileURLWithPath:path];
      [self.webView setOpaque:NO];
    [self.webView loadData:htmlData MIMEType:@"text/html" textEncodingName:@"UTF-8" baseURL:baseURL];
    
    
}


- (void)webViewDidFinishLoad:(UIWebView *)webView {
    //////NSLog(@"%@", @"webViewDidFinishLoad");
     [self RestoreValuesOfStart];
   //  TransitonFinish = YES;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    //////NSLog(@"%@", @"didReceiveMemoryWarning - предупреждение о нехватке памяти");
}

#pragma mark - Flipside View Controller

- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller
{
    /*
     if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
     [self dismissViewControllerAnimated:YES completion:nil];
     } else {
     [self.flipsidePopoverController dismissPopoverAnimated:YES];
     }
     */
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (void)dealloc
{
      [gameCenterManager release];
    [currentPage release];
    [path release];
    [purchaseActivityIndicator release];
    [s1 release];
    [s2 release];
    [touchView release];
    touchView = nil;
    [slova release];
     [currentScoreLabel release];
    [webView release];
    //[_flipsidePopoverController release];
    [lockRight1 release];
    [lockLeft3 release];
    [super dealloc];
}



- (IBAction)showInfo:(id)sender
{
    
    // ////NSLog(  @"** showInfo Button. Goto FlipsideViewController ***");
    
    FlipsideViewController *controller = [[[FlipsideViewController alloc] initWithNibName:@"FlipsideViewController" bundle:nil] autorelease];
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        // FlipsideViewController *controller = [[[FlipsideViewController alloc] initWithNibName:@"FlipsideViewController" bundle:nil] autorelease];
    } else {
        controller = [[[FlipsideViewController alloc] initWithNibName:@"FlipsideViewController_iPad" bundle:nil] autorelease];
    }
    
    controller.delegate = self;
    controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    
    _bannerViewController = [[BannerViewController alloc] initWithContentViewController:controller];
    [self presentViewController:_bannerViewController animated:YES completion:nil];
    
    
    TransitonFinish = YES;
    // ////NSLog(  @"** Finish showInfo Button. Goto FlipsideViewController ***");
}

@end
