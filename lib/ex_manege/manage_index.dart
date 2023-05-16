import 'dart:math';

setBMIIndex(height, weight) {
  ///------------------------------------> BMI

  double bmi;
  if ((height != null) && (weight != null)) {
    bmi = weight / pow(height / 100, 2);
  } else {
    bmi = 0;
  }
  return bmi;
}

List setValueBMI(double bmi) {
  var bmiIndex, stringBmi, detail;
  if (bmi != null) {
    if (bmi > 0.0 && bmi <= 18.5) {
      bmiIndex = 1;
      stringBmi = 'thin';
      detail = 'you are underweight You should exercise to build muscle.';
    }
    if ((bmi > 18.5) && (bmi <= 24.0)) {
      bmiIndex = 1;
      stringBmi = 'slim';
      detail =
          'You are a normal weight Away from diseases caused by obesity. and have the least risk of developing various diseases';
    }
    if (bmi >= 24.0 && bmi <= 29.9) {
      bmiIndex = 2;
      stringBmi = 'fat';
      detail =
          "You are overweight, which puts you at risk for diseases that come with obesity as well. Both diabetes and high blood pressure You should adjust your eating habits, exercise, check your health. \n\n Note: If you are an athlete who uses muscles on a regular basis. You don't need to ignore this notification.";
    }
    if (bmi >= 30) {
      bmiIndex = 2;
      stringBmi = 'very fat';
      detail =
          "You are very overweight. The risk of serious diseases hidden with obesity should adjust eating habits, exercise, health check-ups and consult a doctor. \n\n Note: If you are an athlete who uses muscles on a regular basis. You don't need to ignore this notification.";
    }
  } else {
    bmiIndex = 0;
    stringBmi = '';
    detail = '';
  }

  return [bmiIndex, stringBmi,detail];
}

//--------------------------> exp-------------------->
setIndexExercise(_setexp) {
  double expIndex;
  if (_setexp != null) {
    switch (_setexp) {
      case 'more than 3 times a week':
        {
          expIndex = 4;
        }
        break;

      case 'less than 3 times a week':
        {
          expIndex = 2;
        }
        break;
      case 'never exercise':
        {
          expIndex = 0;
        }
        break;
      default:
        {
          expIndex = 0;
        }
        break;
    }
  } else {
    expIndex = 0;
  }
  return expIndex;
}

setIndexGender(sex) {
  double sexIndex;
  if (sex != null) {
    switch (sex) {
      case "male":
        {
          sexIndex = 1;
        }
        break;

      case "female":
        {
          sexIndex = 1;
        }
        break;
      default:
        {
          sexIndex = 0;
        }
        break;
    }
  } else {
    sexIndex = 0;
  }
  return sexIndex;
}

setIndexAge(age) {
  double ageIndex;
  print(age < 50.0 && age > 12.0);
  if (age != null) {
    if (age <= 12.0 && age > 0) {
      ageIndex = 1;
    } else if (age < 50.0 && age > 12.0) {
      ageIndex = 2;
    } else if (age >= 50) {
      ageIndex = 0;
    } else {
      ageIndex = 0;
    }
  } else {
    ageIndex = 0;
  }
  return ageIndex;
}
