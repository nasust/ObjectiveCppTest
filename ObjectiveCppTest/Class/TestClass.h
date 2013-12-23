//
// Created by 森 秀樹 on 2013/12/23.
// Copyright (c) 2013 nasust. All rights reserved.
//


#include "iostream"
#include "string"

#ifndef __TestClass_H_
#define __TestClass_H_

using namespace std;

class TestClass {
public:
    TestClass(const char *name) : m_name(name) {
        cout << m_name << "::Constructor: " << this << endl;
    }

    virtual ~TestClass() {
        cout << m_name << "::Destructor: " << this << endl;
    }

    void hello() const {
        cout << m_name << "::hello: " << this << endl;
    }

private:
    string m_name;
};


#endif //__TestClass_H_
