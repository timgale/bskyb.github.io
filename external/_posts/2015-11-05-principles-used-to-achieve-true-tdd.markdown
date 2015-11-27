---
layout: post
title:  “Principles used to achieve true TDD”
date:   2015-11-05
author: Christopher Cook
categories: testing
image: /images/blogs/jasmine-karma-sinon.png
excerpt: “Principles used to move to a full Test Driven Development in Sky Store Web.”
---

## Intro
When Sky Store started out, the web development team had the requirement of getting something out on the market as quickly as possible. This meant a few important things suffered, primarily the testing strategy. In this post I’m going to talk a bit about how the team took our AngularJS from extremely limited unit test coverage, to it’s current approach of following a pure TDD approach. Most of the points mentioned here are applicable to virtually any codebase, not specifically Angular.

The benefits of TDD are well documented elsewhere so I’m not going to regurgitate that information, though I will include the following quote which really helped us think about our approach.

>"When you realise that it's all about specifying behaviour and not writing tests, your point of view shifts."

## Our tech stack
Using the combination of Karma and Jasmine was pretty much the de facto choice for unit testing when we started out, along with using Grunt as a task runner. We later added Sinon into the mix, because it provides fantastic stubbing functionality that completely changed our approach to unit testing. Initially we also used Istanbul for code coverage, though we later removed it, which will be covered shortly.

## Our 4 principles of unit testing
When changing our approach to unit testing, we came up with a number of principles that we want to follow when writing unit tests. They're by no means the best rules to follow, and as always there are some circumstances where they don't apply, but they helped us get to achieve a true Test Driven Development environment.

#### Mock/Stub your dependencies
I could write an entire post on methods for stubbing dependencies but I'll try and cover it briefly here. This is the part where Sinon comes in handy. Let's say you’re testing a controller that hits a service. You don’t want the controller unit tests to fail if there’s an issue in the service, your service unit tests should take care of that. You want to remove all possible outside influences when testing a single unit of code. Your automated feature tests will cover the rest. We even extend this behaviour to Angular components like $scope, $window etc. This means that our unit tests have very few outside influences that could potentially skew the results of the test. So as an example, here’s how we would create a stub of $scope using Sinon:

```
var service = {
  getData: sinon.stub()
};
```

The issue with this is the added maintenance of having to remember to update your stubs when you update the real reference, for example changing the method name. To protect ourselves from this issue, we use a helper that takes in a component and returns an object with stubbed versions of any public methods found on the component. You can then use Sinon's built-in stub methods to check these methods are being called: `expect(service.getData.withArgs(id).callCount).toEqual(1);`

#### Code coverage is a lie
Code coverage is used with good intentions, but can hurt your progress much more than it can help you. The issue is that code coverage tools check that code is executed as part of a test, __not__ that it is actually covered by a test. This is dangerous because you can reach a point where your coverage tool reports 100%, whereas the reality can be very different. This means you either need to stop trusting your code coverage, or change the way you think about it and ensure you remember it reports on code that is executed, not tested. Referring back to the quote at the top of this article, putting too much emphasis on just meeting a certain code coverage number means you’re missing the key point of why following TDD is a good idea. We chose to completely remove it, because when you’re following true TDD by writing your tests first, you already know that your code is covered by actual tests.

#### Markup shouldn't contain any logic
Although Angular allows conditional logic in markup, we decided to remove this functionality from our app. Our reasoning that any logic in our app should be within our code, not within our markup. This isn’t strictly a change we made to our unit tests, but to our app architecture. We still use Angular’s ng-if attributes on elements, but now we only expose a single property on $scope for these conditions.
So the following code:

```
<p data-ng-if=“addressIsAvailable && addressLine1Exists && addressVisibility”>{{addressLine1}}</p>
```

turns into this:

```
<p data-ng-if=“shouldShowAddress”>{{addressLine1}}</p>
```

The logic behind the `shouldShowAddress` property is then moved into your code, which means it can be unit tested properly. Of course, covering these scenarios could potentially still be achieved using automated feature tests, but keeping all logic inside your code keeps things more consistent and means you get cleaner markup.

#### Only test what you need
As we started moving to a pure TDD approach, we found we were over-compensating quite a lot. We were testing way too much, and this resulted in a lot of unnecessary tests. Here’s an example of a test that hits a service:

```
expect(service.getData).toBeDefined();
expect(service.getData.callCount).toEqual(1);
expect(service.getData).toEqual(promise);
promise.resolve(returnedData);
expect($scope.data).toEqual(expectedData);
```

This sample is checking:

- Does the public method of the service exist?
- Was the method called?
- Did the method return a promise?
- When the returned promise is resolved, did it return the data we expect and assign it to a scope value?

What we really want to know, the unit of code we’re really trying to test, is that the service returns the data we expect. So the code above can be turned into the code below, and achieve exactly the same thing:

```
promise.resolve(returnedData);
expect($scope.data).toEqual(expectedData);
```

If the method doesn’t exist or it wasn’t called, the test will still fail, but now we have fewer assertions but we’re still achieving the same level of test coverage. This makes tests much more clear without compromising quality. This way of writing tests also links back to the quote at the top of this article. Before writing code you’re forced to think about what you actually want to happen, what the result of running a method is going to be, and this usually results in higher quality, well architected code.

## References

[Karma - Test Runner](http://karma-runner.github.io/0.13/index.html)

[Jasmine - Javascript Testing Framework](http://jasmine.github.io/)

[Sinon - JavaScript spies, stubs and mocks](http://sinonjs.org/)
