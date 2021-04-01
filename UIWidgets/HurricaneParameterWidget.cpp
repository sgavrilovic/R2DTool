/* *****************************************************************************
Copyright (c) 2016-2021, The Regents of the University of California (Regents).
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this
   list of conditions and the following disclaimer.
2. Redistributions in binary form must reproduce the above copyright notice,
   this list of conditions and the following disclaimer in the documentation
   and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

The views and conclusions contained in the software and documentation are those
of the authors and should not be interpreted as representing official policies,
either expressed or implied, of the FreeBSD Project.

REGENTS SPECIFICALLY DISCLAIMS ANY WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.
THE SOFTWARE AND ACCOMPANYING DOCUMENTATION, IF ANY, PROVIDED HEREUNDER IS
PROVIDED "AS IS". REGENTS HAS NO OBLIGATION TO PROVIDE MAINTENANCE, SUPPORT,
UPDATES, ENHANCEMENTS, OR MODIFICATIONS.

*************************************************************************** */

// Written by: Stevan Gavrilovic

#include "HurricaneParameterWidget.h"

#include <QGridLayout>
#include <QLabel>
#include <QLineEdit>
#include <QComboBox>

HurricaneParameterWidget::HurricaneParameterWidget(QWidget* parent) : QWidget(parent)
{
    auto mainLayout = new QGridLayout(this);
    mainLayout->setContentsMargins(5,0,5,0);
    mainLayout->setSpacing(8);

    this->setSizePolicy(QSizePolicy::Maximum,QSizePolicy::Maximum);

    QLabel* latLandfallLabel    = new QLabel("Latitude [°N]",this);
    QLabel* lonLandfallLabel    = new QLabel("Longitude [°E]",this);
    QLabel* angleLandfallLabel  = new QLabel("Landing Angle [°]",this);
    QLabel* pressLandfallLabel  = new QLabel("Pressure [mb]",this);
    QLabel* speedLandfallLabel  = new QLabel("Speed [kts]",this);
    QLabel* radiusLandfallLabel = new QLabel("Radius [nmile]",this);

    QLabel* paramLabel1 = new QLabel("Parameter Value",this);
    QLabel* perturbationLabel1 = new QLabel("Perturbation",this);

    QLabel* paramLabel2 = new QLabel("Parameter Value",this);
    QLabel* perturbationLabel2 = new QLabel("Perturbation",this);

    QLabel* paramLabel3 = new QLabel("Parameter Value",this);

    latLandfallLineEdit     = new QLineEdit(this);
    lonLandfallLineEdit     = new QLineEdit(this);
    angleLandfallLineEdit   = new QLineEdit(this);
    pressLandfallLineEdit   = new QLineEdit(this);
    speedLandfallLineEdit   = new QLineEdit(this);
    radiusLandfallLineEdit  = new QLineEdit(this);

    //    latLandfallLineEdit ->setSizePolicy(QSizePolicy::Expanding,QSizePolicy::Expanding);
    //    lonLandfallLineEdit ->setSizePolicy(QSizePolicy::Expanding,QSizePolicy::Expanding);
    //    angleLandfallLineEdit->setSizePolicy(QSizePolicy::Expanding,QSizePolicy::Expanding);
    //    pressLandfallLineEdit->setSizePolicy(QSizePolicy::Expanding,QSizePolicy::Expanding);
    //    speedLandfallLineEdit->setSizePolicy(QSizePolicy::Expanding,QSizePolicy::Expanding);
    //    radiusLandfallLineEdit->setSizePolicy(QSizePolicy::Expanding,QSizePolicy::Expanding);

    QLineEdit* latLandfallPerturbLineEdit     = new QLineEdit(this);
    QLineEdit* lonLandfallPerturbLineEdit     = new QLineEdit(this);
    QLineEdit* angleLandfallPerturbLineEdit   = new QLineEdit(this);
    QLineEdit* pressLandfallPerturbLineEdit   = new QLineEdit(this);
    QLineEdit* speedLandfallPerturbLineEdit   = new QLineEdit(this);
    QLineEdit* radiusLandfallPerturbLineEdit  = new QLineEdit(this);

    QComboBox* exposureComboBox = new QComboBox(this);
    exposureComboBox->addItem("A");
    exposureComboBox->addItem("B");
    exposureComboBox->addItem("C");
    exposureComboBox->setCurrentText("C");
    QLabel* exposureLabel = new QLabel("Exposure Category",this);

    QLabel* gustLabel = new QLabel("Gust Duration [s]",this);
    QLineEdit* gustLineEdit  = new QLineEdit(this);
    gustLineEdit->setText("3");

    QLabel* refHeightLabel = new QLabel("Reference Height [m]",this);
    QLineEdit* refHeightLineEdit  = new QLineEdit(this);
    refHeightLineEdit->setText("10.0");

    latLandfallPerturbLineEdit->setText("0.0");
    lonLandfallPerturbLineEdit->setText("0.0");
    angleLandfallPerturbLineEdit->setText("90.0");
    pressLandfallPerturbLineEdit->setText("10.0");
    speedLandfallPerturbLineEdit->setText("10.0");
    radiusLandfallPerturbLineEdit->setText("10.0");

    mainLayout->addWidget(paramLabel1,0,0,1,2,Qt::AlignCenter);
    mainLayout->addWidget(perturbationLabel1,0,2,1,1,Qt::AlignCenter);

    mainLayout->addWidget(paramLabel2,0,3,1,2,Qt::AlignCenter);
    mainLayout->addWidget(perturbationLabel2,0,5,1,1,Qt::AlignCenter);

    mainLayout->addWidget(paramLabel3,0,6,1,2,Qt::AlignCenter);

    mainLayout->addWidget(latLandfallLabel,1,0);
    mainLayout->addWidget(latLandfallLineEdit,1,1);
    mainLayout->addWidget(latLandfallPerturbLineEdit,1,2);

    mainLayout->addWidget(lonLandfallLabel,1,3);
    mainLayout->addWidget(lonLandfallLineEdit,1,4);
    mainLayout->addWidget(lonLandfallPerturbLineEdit,1,5);

    mainLayout->addWidget(exposureLabel,1,6);
    mainLayout->addWidget(exposureComboBox,1,7);

    mainLayout->addWidget(angleLandfallLabel,2,0);
    mainLayout->addWidget(angleLandfallLineEdit,2,1);
    mainLayout->addWidget(angleLandfallPerturbLineEdit,2,2);

    mainLayout->addWidget(pressLandfallLabel,2,3);
    mainLayout->addWidget(pressLandfallLineEdit,2,4);
    mainLayout->addWidget(pressLandfallPerturbLineEdit,2,5);

    mainLayout->addWidget(gustLabel,2,6);
    mainLayout->addWidget(gustLineEdit,2,7);

    mainLayout->addWidget(speedLandfallLabel,3,0);
    mainLayout->addWidget(speedLandfallLineEdit,3,1);
    mainLayout->addWidget(speedLandfallPerturbLineEdit,3,2);

    mainLayout->addWidget(radiusLandfallLabel,3,3);
    mainLayout->addWidget(radiusLandfallLineEdit,3,4);
    mainLayout->addWidget(radiusLandfallPerturbLineEdit,3,5);

    mainLayout->addWidget(refHeightLabel,3,6);
    mainLayout->addWidget(refHeightLineEdit,3,7);

    mainLayout->setRowStretch(4,1);
}


void HurricaneParameterWidget::setLandfallLat(const double val)
{
    latLandfallLineEdit->setText(QString::number(val));
}


void HurricaneParameterWidget::setLandfallLon(const double val)
{
    lonLandfallLineEdit->setText(QString::number(val));
}


void HurricaneParameterWidget::setLandfallPress(const double val)
{
    pressLandfallLineEdit->setText(QString::number(val));
}


void HurricaneParameterWidget::setLandingAngle(const double val)
{
    angleLandfallLineEdit->setText(QString::number(val));

}


void HurricaneParameterWidget::setLandfallSpeed(const double val)
{
    speedLandfallLineEdit->setText(QString::number(val));
}


void HurricaneParameterWidget::setLandfallRadius(const double val)
{
    radiusLandfallLineEdit->setText(QString::number(val));
}


void HurricaneParameterWidget::clear(void)
{
    latLandfallLineEdit->clear();
    lonLandfallLineEdit->clear();
    angleLandfallLineEdit->clear();
    pressLandfallLineEdit->clear();
    speedLandfallLineEdit->clear();
    radiusLandfallLineEdit->clear();
}
